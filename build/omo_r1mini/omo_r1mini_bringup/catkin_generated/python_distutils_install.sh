#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/root/laser_extract/src/omo_r1mini/omo_r1mini_bringup"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/root/laser_extract/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/root/laser_extract/install/lib/python3/dist-packages:/root/laser_extract/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/root/laser_extract/build" \
    "/usr/bin/python3" \
    "/root/laser_extract/src/omo_r1mini/omo_r1mini_bringup/setup.py" \
     \
    build --build-base "/root/laser_extract/build/omo_r1mini/omo_r1mini_bringup" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/root/laser_extract/install" --install-scripts="/root/laser_extract/install/bin"
