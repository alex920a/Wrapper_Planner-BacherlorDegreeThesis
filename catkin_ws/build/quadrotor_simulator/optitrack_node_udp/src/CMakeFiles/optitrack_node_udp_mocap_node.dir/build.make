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
include quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/depend.make

# Include the progress variables for this target.
include quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/progress.make

# Include the compile flags for this target's objects.
include quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/flags.make

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o: quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/flags.make
quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o: /home/alessandro/catkin_ws/src/quadrotor_simulator/optitrack_node_udp/src/mocap_node.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alessandro/catkin_ws/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o"
	cd /home/alessandro/catkin_ws/build/quadrotor_simulator/optitrack_node_udp/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o -c /home/alessandro/catkin_ws/src/quadrotor_simulator/optitrack_node_udp/src/mocap_node.cpp

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.i"
	cd /home/alessandro/catkin_ws/build/quadrotor_simulator/optitrack_node_udp/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alessandro/catkin_ws/src/quadrotor_simulator/optitrack_node_udp/src/mocap_node.cpp > CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.i

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.s"
	cd /home/alessandro/catkin_ws/build/quadrotor_simulator/optitrack_node_udp/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alessandro/catkin_ws/src/quadrotor_simulator/optitrack_node_udp/src/mocap_node.cpp -o CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.s

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o.requires:
.PHONY : quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o.requires

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o.provides: quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o.requires
	$(MAKE) -f quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/build.make quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o.provides.build
.PHONY : quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o.provides

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o.provides.build: quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o: quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/flags.make
quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o: /home/alessandro/catkin_ws/src/quadrotor_simulator/optitrack_node_udp/src/socket.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/alessandro/catkin_ws/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o"
	cd /home/alessandro/catkin_ws/build/quadrotor_simulator/optitrack_node_udp/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o -c /home/alessandro/catkin_ws/src/quadrotor_simulator/optitrack_node_udp/src/socket.cpp

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.i"
	cd /home/alessandro/catkin_ws/build/quadrotor_simulator/optitrack_node_udp/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/alessandro/catkin_ws/src/quadrotor_simulator/optitrack_node_udp/src/socket.cpp > CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.i

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.s"
	cd /home/alessandro/catkin_ws/build/quadrotor_simulator/optitrack_node_udp/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/alessandro/catkin_ws/src/quadrotor_simulator/optitrack_node_udp/src/socket.cpp -o CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.s

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o.requires:
.PHONY : quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o.requires

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o.provides: quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o.requires
	$(MAKE) -f quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/build.make quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o.provides.build
.PHONY : quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o.provides

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o.provides.build: quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o

# Object files for target optitrack_node_udp_mocap_node
optitrack_node_udp_mocap_node_OBJECTS = \
"CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o" \
"CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o"

# External object files for target optitrack_node_udp_mocap_node
optitrack_node_udp_mocap_node_EXTERNAL_OBJECTS =

/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libtf.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libtf2_ros.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libactionlib.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libtf2.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libmessage_filters.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/liblaser_geometry.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libmean.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libparams.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libincrement.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libmedian.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libtransfer_function.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libroscpp.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /usr/lib/libboost_signals-mt.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libxmlrpcpp.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /usr/lib/libtinyxml.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /usr/lib/libboost_filesystem-mt.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libclass_loader.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /usr/lib/libPocoFoundation.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /usr/lib/i386-linux-gnu/libdl.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/librosconsole.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/librosconsole_log4cxx.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/librosconsole_backend_interface.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /usr/lib/liblog4cxx.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /usr/lib/libboost_regex-mt.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libroslib.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libroscpp_serialization.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/librostime.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /usr/lib/libboost_date_time-mt.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /usr/lib/libboost_system-mt.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /usr/lib/libboost_thread-mt.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /usr/lib/i386-linux-gnu/libpthread.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libcpp_common.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: /opt/ros/hydro/lib/libconsole_bridge.so
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/build.make
/home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node: quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node"
	cd /home/alessandro/catkin_ws/build/quadrotor_simulator/optitrack_node_udp/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/optitrack_node_udp_mocap_node.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/build: /home/alessandro/catkin_ws/devel/lib/optitrack_node_udp/mocap_node
.PHONY : quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/build

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/requires: quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/mocap_node.cpp.o.requires
quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/requires: quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/socket.cpp.o.requires
.PHONY : quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/requires

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/clean:
	cd /home/alessandro/catkin_ws/build/quadrotor_simulator/optitrack_node_udp/src && $(CMAKE_COMMAND) -P CMakeFiles/optitrack_node_udp_mocap_node.dir/cmake_clean.cmake
.PHONY : quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/clean

quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/depend:
	cd /home/alessandro/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alessandro/catkin_ws/src /home/alessandro/catkin_ws/src/quadrotor_simulator/optitrack_node_udp/src /home/alessandro/catkin_ws/build /home/alessandro/catkin_ws/build/quadrotor_simulator/optitrack_node_udp/src /home/alessandro/catkin_ws/build/quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : quadrotor_simulator/optitrack_node_udp/src/CMakeFiles/optitrack_node_udp_mocap_node.dir/depend

