#!/usr/bin/env bash

PYVER_MAJOR=`python -c "from __future__ import print_function; import sys; print(sys.version_info[0])"`
PYVER_MINOR=`python -c "from __future__ import print_function; import sys; print(sys.version_info[1])"`
PYVER=${PYVER_MAJOR}.${PYVER_MINOR}
echo $PYVER
PY_INCLUDE_DIR=${PREFIX}/include/`ls ${PREFIX}/include/|grep python${PYVER}`
PY_SHAREDLIB=${PREFIX}/lib/`ls ${PREFIX}/lib/|grep libpython${PYVER}[a-z]*.so$`
PY_INCLUDE_DIR="/home/dwp/miniconda3/envs/conda-recipe/include/python3.10/;/home/dwp/miniconda3/envs/conda-recipe/lib/python3.10/site-packages/numpy/_core/include"
echo $PY_INCLUDE_DIR
echo $PY_SHAREDLIB

mkdir build
cd build
cmake \
    -DPYTHON_INCLUDE_DIR=${PY_INCLUDE_DIR} \
    -DPYTHON_LIBRARY=${PY_SHAREDLIB} \
    -DCONDA_BUILD=TRUE \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DDEPLOYMENT_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_SYSTEM_LIBRARY_PATH=$PREFIX/lib \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    .. \
    && make && make install
