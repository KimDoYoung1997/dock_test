#!/usr/bin/env python3
## 230914 0835
import rospy
from geometry_msgs.msg import Twist, Point, Quaternion, PoseStamped
import tf
from math import radians, copysign, sqrt, pow, pi, atan2
from tf.transformations import euler_from_quaternion
import numpy as np
from nav_msgs.msg import Odometry
class GotoPoint():
    def __init__(self):
        rospy.init_node('robot_pointop_key', anonymous=False)
        rospy.on_shutdown(self.shutdown)
        self.cmd_vel = rospy.Publisher('TE2318999/cmd_vel', Twist, queue_size=5)
        rospy.Subscriber('/TE2318999/odometry/filtered', Odometry, self.odom_callback)
        rospy.Subscriber('/TE2318999/move_base_simple/goal', PoseStamped, self.goal_callback)
        position = Point()
        move_cmd = Twist()
        self.goal_received = False
        while not self.goal_received:
            rospy.sleep(1)  # Waiting until a goal is received
        self.goal_reached_flag = False
        
### rotation matrix update
        (position, rotation) = self.get_current_state()
        self.goal_x_rotated = (self.goal_x * np.cos(rotation)) - (self.goal_y * np.sin(rotation)) + position.x
        self.goal_y_rotated = (self.goal_x * np.sin(rotation)) + (self.goal_y * np.cos(rotation)) + position.y
        self.goal_x = self.goal_x_rotated
        self.goal_y = self.goal_y_rotated
        self.goal_z = self.goal_z + rotation
        pre_goal = 0.3 # m
        self.state = 0
        self.goal_points = [
            {'x': position.x, 'y': self.goal_y, 'z': self.goal_z},
            {'x': self.goal_x-0.6 , 'y': self.goal_y, 'z': self.goal_z},
            {'x': self.goal_x, 'y': self.goal_y, 'z': self.goal_z},
            #{'x': 0.1, 'y': 0, 'z': 0}
        ]
        while self.state < len(self.goal_points):
            self.set_goal_point()
            self.move_to_goal()
            self.rotate_to_goal()
            if self.goal_reached():
                self.state += 1
                if self.state == len(self.goal_points):
                    print("Goal reached. Stopping the robot.")
                    self.goal_reached_flag = True
                    break
        rospy.loginfo("Stopping the robot...")
        self.cmd_vel.publish(Twist())
    def set_goal_point(self):
        self.goal_x = self.goal_points[self.state]['x']
        self.goal_y = self.goal_points[self.state]['y']
        self.goal_z = self.goal_points[self.state]['z']
    def move_to_goal(self):
        #position, rotation = self.get_odom()
        (position, rotation) = self.get_current_state()
        move_cmd = Twist()
        last_rotation = 0
        linear_speed = 0.2
        angular_speed = 0.2
        #goal_x = self.goal_x
        #goal_y = self.goal_y
        goal_distance = sqrt(pow(self.goal_x - position.x, 2) + pow(self.goal_y - position.y, 2))
        distance = goal_distance
        while distance > 0.05:
            position, rotation = self.get_current_state()
            x_start = position.x
            y_start = position.y
            path_angle = atan2(self.goal_y - y_start, self.goal_x - x_start)
            if path_angle < -pi/4 or path_angle > pi/4:
                if self.goal_y < 0 and y_start < self.goal_y:
                    path_angle = -2*pi + path_angle
                elif self.goal_y >= 0 and y_start > self.goal_y:
                    path_angle = 2*pi + path_angle
            if last_rotation > pi-0.1 and rotation <= 0:
                rotation = 2*pi + rotation
            elif last_rotation < -pi+0.1 and rotation > 0:
                rotation = -2*pi + rotation
            move_cmd.angular.z = angular_speed * (path_angle-rotation)
            distance = sqrt(pow((self.goal_x - x_start), 2) + pow((self.goal_y - y_start), 2))
            move_cmd.linear.x = min(linear_speed * distance, 0.1)
            if move_cmd.angular.z > 0:
                move_cmd.angular.z = min(move_cmd.angular.z, 1.5)
            else:
                move_cmd.angular.z = max(move_cmd.angular.z, -1.5)
            last_rotation = rotation
            self.cmd_vel.publish(move_cmd)
            r = rospy.Rate(10)
            r.sleep()
    def rotate_to_goal(self):
        position, rotation = self.get_current_state()
        move_cmd = Twist()
        while abs(rotation - self.goal_z) > 0.05:
            position, rotation = self.get_current_state()
            if self.goal_z >= 0:
                if rotation <= self.goal_z and rotation >= self.goal_z - pi:
                    move_cmd.linear.x = 0.00
                    move_cmd.angular.z = 0.2
                else:
                    move_cmd.linear.x = 0.00
                    move_cmd.angular.z = -0.2
            else:
                if rotation <= self.goal_z + pi and rotation > self.goal_z:
                    move_cmd.linear.x = 0.00
                    move_cmd.angular.z = -0.2
                else:
                    move_cmd.linear.x = 0.00
                    move_cmd.angular.z = 0.2
            self.cmd_vel.publish(move_cmd)
            r = rospy.Rate(10)
            r.sleep()
    def goal_reached(self):
        position, rotation = self.get_current_state()
        distance = sqrt(pow((self.goal_x - position.x), 2) + pow((self.goal_y - position.y), 2))
        return distance < 0.05 and abs(rotation - (self.goal_z)) < 0.05
    def goal_callback(self, msg):
        print("Goal received!!")
        self.goal_x = msg.pose.position.x
        self.goal_y = msg.pose.position.y
        # Getting the orientation in the form of quaternion
        quaternion = (
            msg.pose.orientation.x,
            msg.pose.orientation.y,
            msg.pose.orientation.z,
            msg.pose.orientation.w
        )
        # Convert quaternion to euler angles
        euler = euler_from_quaternion(quaternion)
        self.goal_z = euler[2]  # We are only interested in the z component
        self.goal_received = True
    def odom_callback(self, msg):
        # position
        self.current_position = msg.pose.pose.position
        # rotation (Quaternion)
        quaternion = (
            msg.pose.pose.orientation.x,
            msg.pose.pose.orientation.y,
            msg.pose.pose.orientation.z,
            msg.pose.pose.orientation.w
        )
        # Quaternion to euler (radian)
        euler = euler_from_quaternion(quaternion)
        # yaw (only z axis rotation)
        self.current_rotation = euler[2]  # 0:x 1:y  2:z
    def get_current_state(self):
        return self.current_position, self.current_rotation
    def shutdown(self):
        self.cmd_vel.publish(Twist())
        rospy.sleep(1)
        
        
if __name__ == '__main__':
    goto_point_instance = GotoPoint()
    try:
        while not rospy.is_shutdown():
            if goto_point_instance.goal_reached_flag:  # Check the flag
                print("Program terminating as the goal has been reached.")
                break  # Exit the loop and terminate the program
    except:
        rospy.loginfo("shutdown program.")
