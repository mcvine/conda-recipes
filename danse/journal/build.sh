#!/usr/bin/env bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
	SHAREDLIB=so
	;;
    Darwin*)
	SHAREDLIB=dylib
	;;
    *)  echo "${unameOut} unsupported"; exit 1
esac

PYVER_MAJOR=`python -c "from __future__ import print_function; import sys; print(sys.version_info[0])"`
PYVER_MINOR=`python -c "from __future__ import print_function; import sys; print(sys.version_info[1])"`
PYVER=${PYVER_MAJOR}.${PYVER_MINOR}
echo $PYVER
PY_INCLUDE_DIR=${PREFIX}/include/`ls ${PREFIX}/include/|grep python${PYVER}`
PY_SHAREDLIB=${PREFIX}/lib/`ls ${PREFIX}/lib/|grep libpython${PYVER}[a-z]*.so$`
echo $PY_INCLUDE_DIR
echo $PY_SHAREDLIB

# 09062020: changed to match that of pyre conda recipe. not tested yet
mkdir build
cd build
cmake \
    -DCONDA_BUILD=TRUE \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -DDEPLOYMENT_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_SYSTEM_LIBRARY_PATH=$PREFIX/lib \
    -DPYTHON_INCLUDE_DIR=${PY_INCLUDE_DIR} \
    -DPYTHON_LIBRARY=${PY_SHAREDLIB} \
    .. \
    && make && make install

# -DPYTHON_INCLUDE_DIR=${PREFIX}/include/python${PYVER} \
#    -DPYTHON_LIBRARY=${PREFIX}/lib/libpython${PYVER}.${SHAREDLIB} \
#cmake \
#    -DCMAKE_SKIP_INSTALL_RPATH=ON \
#    -DCONDA_BUILD=TRUE \
#    -DCMAKE_INSTALL_PREFIX=$PREFIX -DDEPLOYMENT_PREFIX=$PREFIX -DCMAKE_SYSTEM_LIBRARY_PATH=$PREFIX/lib \
#    .. \
#    && make && make install
