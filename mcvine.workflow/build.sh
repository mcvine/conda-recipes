#!/usr/bin/env bash

let CORES=`grep -c ^processor /proc/cpuinfo`
let CORES-=1
if ((CORES < 1)); then
    CORES = 1;
fi

PYVER_MAJOR=`python -c "import sys; print sys.version_info[0]"`
PYVER_MINOR=`python -c "import sys; print sys.version_info[1]"`
PYVER=${PYVER_MAJOR}.${PYVER_MINOR}

mkdir build
cd build
cmake \
    -DPYTHON_LIBRARY=${PREFIX}/lib/libpython${PYVER}.so \
    -DPYTHON_INCLUDE_DIR=${PREFIX}/include/python${PYVER} \
    -DCMAKE_INSTALL_PREFIX=$PREFIX -DDEPLOYMENT_PREFIX=$PREFIX \
    -DCMAKE_SYSTEM_LIBRARY_PATH=$PREFIX/lib .. \
  && make install
