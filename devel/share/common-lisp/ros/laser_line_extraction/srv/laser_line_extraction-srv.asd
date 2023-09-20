
(cl:in-package :asdf)

(defsystem "laser_line_extraction-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "GetGoalPose" :depends-on ("_package_GetGoalPose"))
    (:file "_package_GetGoalPose" :depends-on ("_package"))
  ))