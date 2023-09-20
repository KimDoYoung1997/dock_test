#! /usr/bin/env python3
from std_msgs.msg import Int16
import rospy

class ModeControllerClass():
    '''
    Detects mode based on imu sensor data
    Counts laps
    '''

    def __init__(self):
        self.initialize_variables()
        self.initialize_ros_entities()
        self.mode ='rmf_driving'
        print(self.mode)
    def initialize_variables(self):
        self.mode = ''
        self.control_dict = {
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
        rospy.Subscriber("/status", Int16, self.status_callback)
        rospy.Publisher("/status", Int16, queue_size=10)
    def status_callback(self, msg):
        pass 

    def set_mode(self, mode):
        self.mode = mode


    def get_mode(self):
        return self.mode
    
