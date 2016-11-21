execute_process(COMMAND "/home/alessandro/catkin_ws/build/quadrotor_simulator/ackermann_vehicle/ackermann_teleop/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/alessandro/catkin_ws/build/quadrotor_simulator/ackermann_vehicle/ackermann_teleop/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
