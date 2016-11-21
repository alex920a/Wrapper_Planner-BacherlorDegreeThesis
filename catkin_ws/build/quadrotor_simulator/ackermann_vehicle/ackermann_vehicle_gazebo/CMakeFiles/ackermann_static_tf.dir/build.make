# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/alessandro/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alessandro/catkin_ws/build

# Include any dependencies generated for this target.
include quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/depend.make

# Include the progress variables for this target.
include quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/progress.make

# Include the compile flags for this target's objects.
include quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/flags.make

quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o: quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/flags.make
quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o: /home/alessandro/catkin_ws/src/quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/nodes/ackermann_static_tf.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alessandro/catkin_ws/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o"
	cd /home/alessandro/catkin_ws/build/quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o -c /home/alessandro/catkin_ws/src/quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/nodes/ackermann_static_tf.cpp

quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.i"
	cd /home/alessandro/catkin_ws/build/quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alessandro/catkin_ws/src/quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/nodes/ackermann_static_tf.cpp > CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.i

quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.s"
	cd /home/alessandro/catkin_ws/build/quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alessandro/catkin_ws/src/quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/nodes/ackermann_static_tf.cpp -o CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.s

quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o.requires:
.PHONY : quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o.requires

quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o.provides: quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o.requires
	$(MAKE) -f quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/build.make quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o.provides.build
.PHONY : quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o.provides

quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o.provides.build: quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o

# Object files for target ackermann_static_tf
ackermann_static_tf_OBJECTS = \
"CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o"

# External object files for target ackermann_static_tf
ackermann_static_tf_EXTERNAL_OBJECTS =

/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_api_plugin.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_paths_plugin.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libvision_reconfigure.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_camera_utils.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_camera.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_multicamera.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_depth_camera.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_openni_kinect.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_gpu_laser.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_laser.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_block_laser.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_p3d.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_imu.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_f3d.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_bumper.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_template.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_projector.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_prosilica.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_force.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_joint_trajectory.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_joint_pose_trajectory.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_diff_drive.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_skid_steer_drive.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_video.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libgazebo_ros_planar_move.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/liburdf.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/liburdfdom_sensor.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/liburdfdom_model_state.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/liburdfdom_model.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/liburdfdom_world.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/librosconsole_bridge.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libpcl_ros_filters.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libpcl_ros_io.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libpcl_ros_tf.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_common.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_kdtree.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_octree.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_search.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_io.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_sample_consensus.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_filters.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_visualization.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_outofcore.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_features.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_segmentation.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_people.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_registration.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_recognition.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_keypoints.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_surface.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_tracking.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libpcl_apps.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libboost_iostreams-mt.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libboost_serialization-mt.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libqhull.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libOpenNI.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libflann_cpp_s.a
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libvtkCommon.so.5.8.0
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libvtkRendering.so.5.8.0
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libvtkHybrid.so.5.8.0
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libvtkCharts.so.5.8.0
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libdynamic_reconfigure_config_init_mutex.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libnodeletlib.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libbondcpp.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/i386-linux-gnu/libuuid.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/librosbag.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/librosbag_storage.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libboost_program_options-mt.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libtopic_tools.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libtf.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libtf2_ros.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libactionlib.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libtf2.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libimage_transport.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libmessage_filters.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libtinyxml.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libclass_loader.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libPocoFoundation.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/i386-linux-gnu/libdl.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libroscpp.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libboost_signals-mt.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libboost_filesystem-mt.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libxmlrpcpp.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libroslib.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libroscpp_serialization.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/librosconsole.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/librosconsole_log4cxx.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/librosconsole_backend_interface.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/liblog4cxx.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libboost_regex-mt.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/librostime.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libboost_date_time-mt.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libboost_system-mt.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/libboost_thread-mt.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /usr/lib/i386-linux-gnu/libpthread.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libcpp_common.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: /opt/ros/hydro/lib/libconsole_bridge.so
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/build.make
/home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf: quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf"
	cd /home/alessandro/catkin_ws/build/quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ackermann_static_tf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/build: /home/alessandro/catkin_ws/devel/lib/ackermann_vehicle_gazebo/ackermann_static_tf
.PHONY : quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/build

quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/requires: quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/nodes/ackermann_static_tf.cpp.o.requires
.PHONY : quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/requires

quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/clean:
	cd /home/alessandro/catkin_ws/build/quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo && $(CMAKE_COMMAND) -P CMakeFiles/ackermann_static_tf.dir/cmake_clean.cmake
.PHONY : quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/clean

quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/depend:
	cd /home/alessandro/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alessandro/catkin_ws/src /home/alessandro/catkin_ws/src/quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo /home/alessandro/catkin_ws/build /home/alessandro/catkin_ws/build/quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo /home/alessandro/catkin_ws/build/quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : quadrotor_simulator/ackermann_vehicle/ackermann_vehicle_gazebo/CMakeFiles/ackermann_static_tf.dir/depend
