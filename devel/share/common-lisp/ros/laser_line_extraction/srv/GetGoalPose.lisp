; Auto-generated. Do not edit!


(cl:in-package laser_line_extraction-srv)


;//! \htmlinclude GetGoalPose-request.msg.html

(cl:defclass <GetGoalPose-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetGoalPose-request (<GetGoalPose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetGoalPose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetGoalPose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_line_extraction-srv:<GetGoalPose-request> is deprecated: use laser_line_extraction-srv:GetGoalPose-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetGoalPose-request>) ostream)
  "Serializes a message object of type '<GetGoalPose-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetGoalPose-request>) istream)
  "Deserializes a message object of type '<GetGoalPose-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetGoalPose-request>)))
  "Returns string type for a service object of type '<GetGoalPose-request>"
  "laser_line_extraction/GetGoalPoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetGoalPose-request)))
  "Returns string type for a service object of type 'GetGoalPose-request"
  "laser_line_extraction/GetGoalPoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetGoalPose-request>)))
  "Returns md5sum for a message object of type '<GetGoalPose-request>"
  "9ae20343ba64ec05ab718b1738b7da43")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetGoalPose-request)))
  "Returns md5sum for a message object of type 'GetGoalPose-request"
  "9ae20343ba64ec05ab718b1738b7da43")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetGoalPose-request>)))
  "Returns full string definition for message of type '<GetGoalPose-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetGoalPose-request)))
  "Returns full string definition for message of type 'GetGoalPose-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetGoalPose-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetGoalPose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetGoalPose-request
))
;//! \htmlinclude GetGoalPose-response.msg.html

(cl:defclass <GetGoalPose-response> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GetGoalPose-response (<GetGoalPose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetGoalPose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetGoalPose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_line_extraction-srv:<GetGoalPose-response> is deprecated: use laser_line_extraction-srv:GetGoalPose-response instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <GetGoalPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_line_extraction-srv:pose-val is deprecated.  Use laser_line_extraction-srv:pose instead.")
  (pose m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetGoalPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_line_extraction-srv:success-val is deprecated.  Use laser_line_extraction-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetGoalPose-response>) ostream)
  "Serializes a message object of type '<GetGoalPose-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetGoalPose-response>) istream)
  "Deserializes a message object of type '<GetGoalPose-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetGoalPose-response>)))
  "Returns string type for a service object of type '<GetGoalPose-response>"
  "laser_line_extraction/GetGoalPoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetGoalPose-response)))
  "Returns string type for a service object of type 'GetGoalPose-response"
  "laser_line_extraction/GetGoalPoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetGoalPose-response>)))
  "Returns md5sum for a message object of type '<GetGoalPose-response>"
  "9ae20343ba64ec05ab718b1738b7da43")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetGoalPose-response)))
  "Returns md5sum for a message object of type 'GetGoalPose-response"
  "9ae20343ba64ec05ab718b1738b7da43")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetGoalPose-response>)))
  "Returns full string definition for message of type '<GetGoalPose-response>"
  (cl:format cl:nil "geometry_msgs/PoseStamped pose~%bool success~%~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetGoalPose-response)))
  "Returns full string definition for message of type 'GetGoalPose-response"
  (cl:format cl:nil "geometry_msgs/PoseStamped pose~%bool success~%~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetGoalPose-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetGoalPose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetGoalPose-response
    (cl:cons ':pose (pose msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetGoalPose)))
  'GetGoalPose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetGoalPose)))
  'GetGoalPose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetGoalPose)))
  "Returns string type for a service object of type '<GetGoalPose>"
  "laser_line_extraction/GetGoalPose")