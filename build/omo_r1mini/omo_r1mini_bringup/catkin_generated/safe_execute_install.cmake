execute_process(COMMAND "/root/laser_extract/build/omo_r1mini/omo_r1mini_bringup/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/root/laser_extract/build/omo_r1mini/omo_r1mini_bringup/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
