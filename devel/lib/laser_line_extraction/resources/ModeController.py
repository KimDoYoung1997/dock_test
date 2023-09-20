#! /usr/bin/env python3
from std_msgs.msg import Int16
import rospy

class ModeControllerClass():
    '''
    Mode change class
    '''

    def __init__(self):
        self.msg = Int16()
        self.initialize_variables()
        self.set_mode('none')
        print("hi")
        rospy.loginfo("Waiting for status:")
        #self.initialize_ros_entities()
        #self.mode ='rmf_driving'
        #print(self.mode)
        #while not rospy.is_shutdown():
        #    rospy.sleep(1)
    def initialize_variables(self):
        self.mode = 'none'
        self.control_dict = {
            'none' : -1,
            'rmf_driving' : 0,
            'rmf_arrived': 1,
            'docking_progress': 2,
            'docking_complete ': 3,
            'lift_up': 4,
            'lift_finished_and_move_back': 5,
            'rmf_restart' : 6,
            'lift_down': 7,
        }

    def initialize_ros_entities(self):
        self.status_subscriber = rospy.Subscriber("/status", Int16, self.status_callback)
        self.status_publisher = rospy.Publisher("/status", Int16, queue_size=10)
        
        r = rospy.Rate(1)  # 1 Hz
        
        #self.status_subscriber = rospy.Subscriber("/status", Int16, self.status_callback)
        while not rospy.is_shutdown():
            #msg = Int16()
            #msg.data = 1
            self.msg.data= self.control_dict[self.mode]    
            self.status_publisher.publish(self.msg)
            
            rospy.loginfo("Published: %d", self.msg.data)
            
            r.sleep()
        
    def status_callback(self, msg):
        #pass 
        if msg.data ==self.control_dict['rmf_arrived']:
            self.msg.data= msg.data

            return self.msg.data
        #    msg
        #    print("hi")
        #    self.mode = 'docking_progress' 
        

    def set_mode(self, mode):
        self.mode = mode
        if self.mode == 'docking' and self.msg.data==1:
            self.initialize_ros_entities()



    def get_mode(self):
        return self.mode
    

#if __name__ == '__main__':
#    ModeControllerClass()
