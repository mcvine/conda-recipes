#!/usr/bin/env bash

PYVER_MAJOR=`python -c "from __future__ import print_function; import sys; print(sys.version_info[0])"`
PYVER_MINOR=`python -c "from __future__ import print_function; import sys; print(sys.version_info[1])"`
PYVER=${PYVER_MAJOR}.${PYVER_MINOR}

mkdir build
cd build
cmake \
    -DCONDA_BUILD=TRUE -DCMAKE_INSTALL_PREFIX=$PREFIX -DDEPLOYMENT_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_SYSTEM_LIBRARY_PATH=$PREFIX/lib \
    .. \
    && make && make install


#   -DPYTHON_LIBRARY=${PREFIX}/lib/libpython${PYVER}.so \
#   -DPYTHON_INCLUDE_DIR=${PREFIX}/include/python${PYVER} \
