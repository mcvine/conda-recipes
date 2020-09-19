#!/usr/bin/env bash

let CORES=`grep -c ^processor /proc/cpuinfo`
let CORES-=1
if ((CORES < 1)); then
    CORES = 1;
fi

PYVER_MAJOR=`python -c "from __future__ import print_function; import sys; print(sys.version_info[0])"`
PYVER_MINOR=`python -c "from __future__ import print_function; import sys; print(sys.version_info[1])"`
PYVER=${PYVER_MAJOR}.${PYVER_MINOR}
SHAREDLIB=so

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

