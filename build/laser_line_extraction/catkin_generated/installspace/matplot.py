#!/usr/bin/env python3

import rospy
import numpy as np
from laser_line_extraction.msg import LineSegmentList
import matplotlib.pyplot as plt
import math

# Global lists to store the radius and angle values
radii = []
angles = []

def line_segments_callback(data):
    global radii, angles
    radii = []
    angles = []
    for segment in data.line_segments:
        rospy.loginfo("Radius: %s, Angle: %s", segment.radius, segment.angle)
        radii.append(segment.radius)
        angles.append(segment.angle)
    
    # Call the function to update the plot
    update_plot(radii, angles)

def update_plot(radii, angles):
    plt.clf()
    x = [r * math.cos(a) for r, a in zip(radii, angles)]
    y = [r * math.sin(a) for r, a in zip(radii, angles)]

    plt.scatter(x, y)
    plt.xlabel('X')
    plt.ylabel('Y')
    plt.title('Line Segments Visualization')
    plt.grid(True)
    plt.pause(0.001)  # Pause to allow the plot to update

def listener():
    rospy.init_node('line_segments_listener', anonymous=True)
    rospy.Subscriber("/line_segments", LineSegmentList, line_segments_callback)

    # Set up the plot
    plt.ion()  # Turn on interactive mode
    plt.figure()

    # Keep the node running
    rospy.spin()

if __name__ == '__main__':
    listener()



