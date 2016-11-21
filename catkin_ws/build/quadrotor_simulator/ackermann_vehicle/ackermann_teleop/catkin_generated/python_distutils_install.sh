#!/bin/sh -x

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

cd "/home/alessandro/catkin_ws/src/quadrotor_simulator/ackermann_vehicle/ackermann_teleop"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/alessandro/catkin_ws/install/lib/python2.7/dist-packages:/home/alessandro/catkin_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/alessandro/catkin_ws/build" \
    "/usr/bin/python" \
    "/home/alessandro/catkin_ws/src/quadrotor_simulator/ackermann_vehicle/ackermann_teleop/setup.py" \
    build --build-base "/home/alessandro/catkin_ws/build/quadrotor_simulator/ackermann_vehicle/ackermann_teleop" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/alessandro/catkin_ws/install" --install-scripts="/home/alessandro/catkin_ws/install/bin"
