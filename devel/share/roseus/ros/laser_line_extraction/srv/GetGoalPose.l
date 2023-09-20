;; Auto-generated. Do not edit!


(when (boundp 'laser_line_extraction::GetGoalPose)
  (if (not (find-package "LASER_LINE_EXTRACTION"))
    (make-package "LASER_LINE_EXTRACTION"))
  (shadow 'GetGoalPose (find-package "LASER_LINE_EXTRACTION")))
(unless (find-package "LASER_LINE_EXTRACTION::GETGOALPOSE")
  (make-package "LASER_LINE_EXTRACTION::GETGOALPOSE"))
(unless (find-package "LASER_LINE_EXTRACTION::GETGOALPOSEREQUEST")
  (make-package "LASER_LINE_EXTRACTION::GETGOALPOSEREQUEST"))
(unless (find-package "LASER_LINE_EXTRACTION::GETGOALPOSERESPONSE")
  (make-package "LASER_LINE_EXTRACTION::GETGOALPOSERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass laser_line_extraction::GetGoalPoseRequest
  :super ros::object
  :slots ())

(defmethod laser_line_extraction::GetGoalPoseRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass laser_line_extraction::GetGoalPoseResponse
  :super ros::object
  :slots (_pose _success ))

(defmethod laser_line_extraction::GetGoalPoseResponse
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::PoseStamped :init))
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _success __success)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _pose
    (send _pose :serialization-length)
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _pose
       (send _pose :serialize s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass laser_line_extraction::GetGoalPose
  :super ros::object
  :slots ())

(setf (get laser_line_extraction::GetGoalPose :md5sum-) "9ae20343ba64ec05ab718b1738b7da43")
(setf (get laser_line_extraction::GetGoalPose :datatype-) "laser_line_extraction/GetGoalPose")
(setf (get laser_line_extraction::GetGoalPose :request) laser_line_extraction::GetGoalPoseRequest)
(setf (get laser_line_extraction::GetGoalPose :response) laser_line_extraction::GetGoalPoseResponse)

(defmethod laser_line_extraction::GetGoalPoseRequest
  (:response () (instance laser_line_extraction::GetGoalPoseResponse :init)))

(setf (get laser_line_extraction::GetGoalPoseRequest :md5sum-) "9ae20343ba64ec05ab718b1738b7da43")
(setf (get laser_line_extraction::GetGoalPoseRequest :datatype-) "laser_line_extraction/GetGoalPoseRequest")
(setf (get laser_line_extraction::GetGoalPoseRequest :definition-)
      "---
geometry_msgs/PoseStamped pose
bool success



================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get laser_line_extraction::GetGoalPoseResponse :md5sum-) "9ae20343ba64ec05ab718b1738b7da43")
(setf (get laser_line_extraction::GetGoalPoseResponse :datatype-) "laser_line_extraction/GetGoalPoseResponse")
(setf (get laser_line_extraction::GetGoalPoseResponse :definition-)
      "---
geometry_msgs/PoseStamped pose
bool success



================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :laser_line_extraction/GetGoalPose "9ae20343ba64ec05ab718b1738b7da43")


