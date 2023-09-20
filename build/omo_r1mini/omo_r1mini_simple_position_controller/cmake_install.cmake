# Install script for directory: /root/laser_extract/src/omo_r1mini/omo_r1mini_simple_position_controller

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/root/laser_extract/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/omo_r1mini_simple_position_controller/action" TYPE FILE FILES "/root/laser_extract/src/omo_r1mini/omo_r1mini_simple_position_controller/action/VanillaPosition.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/omo_r1mini_simple_position_controller/msg" TYPE FILE FILES
    "/root/laser_extract/devel/share/omo_r1mini_simple_position_controller/msg/VanillaPositionAction.msg"
    "/root/laser_extract/devel/share/omo_r1mini_simple_position_controller/msg/VanillaPositionActionGoal.msg"
    "/root/laser_extract/devel/share/omo_r1mini_simple_position_controller/msg/VanillaPositionActionResult.msg"
    "/root/laser_extract/devel/share/omo_r1mini_simple_position_controller/msg/VanillaPositionActionFeedback.msg"
    "/root/laser_extract/devel/share/omo_r1mini_simple_position_controller/msg/VanillaPositionGoal.msg"
    "/root/laser_extract/devel/share/omo_r1mini_simple_position_controller/msg/VanillaPositionResult.msg"
    "/root/laser_extract/devel/share/omo_r1mini_simple_position_controller/msg/VanillaPositionFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/omo_r1mini_simple_position_controller/cmake" TYPE FILE FILES "/root/laser_extract/build/omo_r1mini/omo_r1mini_simple_position_controller/catkin_generated/installspace/omo_r1mini_simple_position_controller-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/root/laser_extract/devel/include/omo_r1mini_simple_position_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/root/laser_extract/devel/share/roseus/ros/omo_r1mini_simple_position_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/root/laser_extract/devel/share/common-lisp/ros/omo_r1mini_simple_position_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/root/laser_extract/devel/share/gennodejs/ros/omo_r1mini_simple_position_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/root/laser_extract/devel/lib/python3/dist-packages/omo_r1mini_simple_position_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/root/laser_extract/devel/lib/python3/dist-packages/omo_r1mini_simple_position_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/root/laser_extract/build/omo_r1mini/omo_r1mini_simple_position_controller/catkin_generated/installspace/omo_r1mini_simple_position_controller.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/omo_r1mini_simple_position_controller/cmake" TYPE FILE FILES "/root/laser_extract/build/omo_r1mini/omo_r1mini_simple_position_controller/catkin_generated/installspace/omo_r1mini_simple_position_controller-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/omo_r1mini_simple_position_controller/cmake" TYPE FILE FILES
    "/root/laser_extract/build/omo_r1mini/omo_r1mini_simple_position_controller/catkin_generated/installspace/omo_r1mini_simple_position_controllerConfig.cmake"
    "/root/laser_extract/build/omo_r1mini/omo_r1mini_simple_position_controller/catkin_generated/installspace/omo_r1mini_simple_position_controllerConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/omo_r1mini_simple_position_controller" TYPE FILE FILES "/root/laser_extract/src/omo_r1mini/omo_r1mini_simple_position_controller/package.xml")
endif()

