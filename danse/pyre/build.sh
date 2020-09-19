#!/usr/bin/env bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
	let CORES=`grep -c ^processor /proc/cpuinfo`
	SHAREDLIB=so
	;;
    Darwin*)
	let CORES=`sysctl -n hw.ncpu`
	SHAREDLIB=dylib
	;;
    *)  echo "${unameOut} unsupported"; exit 1
esac

PYVER_MAJOR=`python -c "from __future__ import print_function; import sys; print(sys.version_info[0])"`
PYVER_MINOR=`python -c "from __future__ import print_function; import sys; print(sys.version_info[1])"`
PYVER=${PYVER_MAJOR}.${PYVER_MINOR}
echo $PYVER

mkdir build
cd build
cmake \
    -DCONDA_BUILD=TRUE \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DDEPLOYMENT_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_SYSTEM_LIBRARY_PATH=$PREFIX/lib \
    -DPYTHON_INCLUDE_DIR=${PREFIX}/include/python${PYVER} \
    -DPYTHON_LIBRARY=${PREFIX}/lib/libpython${PYVER}.${SHAREDLIB} \
    .. \
    && make -j $CORES && make install
