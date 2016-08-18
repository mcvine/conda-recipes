#!/usr/bin/env bash

let CORES=`grep -c ^processor /proc/cpuinfo`
let CORES-=1
if ((CORES < 1)); then
    CORES = 1;
fi

PYVER_MAJOR=${CONDA_PY:0:1}
PYVER_MINOR=${CONDA_PY:1:1}
PYVER=${PYVER_MAJOR}.${PYVER_MINOR}

mkdir build
cd build
cmake -DCONDA_BUILD=TRUE \
    -DCMAKE_INSTALL_PREFIX=$PREFIX -DDEPLOYMENT_PREFIX=$PREFIX \
    -DPYTHON_LIBRARY=${PREFIX}/lib/libpython${PYVER}.so \
    -DPYTHON_INCLUDE_DIR=${PREFIX}/include/python${PYVER} \
    -DBOOST_ROOT=$PREFIX \
    -DCMAKE_SYSTEM_LIBRARY_PATH=$PREFIX/lib .. \
  && make -j $CORES \
  && make -j$CORES reconfigure-to-include-mcstas-components \
  && make -j$CORES wrap-mcstas-components-cmake \
  && make -j$CORES \
  && make install
