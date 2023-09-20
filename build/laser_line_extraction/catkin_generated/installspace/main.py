#! /usr/bin/env python3
# -*- coding:utf-8 -*-

import rospy
from listen_radius_angle import LineSegmentListener
#from vanilla_pos_ctrl_ac import GotoPoint

#rospy.init_node('test')


if __name__ == '__main__':
    while not rospy.is_shutdown():
        LineSegmentListener()
        #goto_point_instance = GotoPoint()
    # try:
    #     while not rospy.is_shutdown():
    #         if goto_point_instance.goal_reached_flag:  # Check the flag
    #             print("Program terminating as the goal has been reached.")
    #             break  # Exit the loop and terminate the program
    # except:
    #     rospy.loginfo("shutdown program.")
