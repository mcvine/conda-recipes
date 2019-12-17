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

# -DPYTHON_INCLUDE_DIR=${PREFIX}/include/python${PYVER} \
#    -DPYTHON_LIBRARY=${PREFIX}/lib/libpython${PYVER}.${SHAREDLIB} \
mkdir build
cd build
cmake \
    -DCONDA_BUILD=TRUE \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=$PREFIX -DDEPLOYMENT_PREFIX=$PREFIX -DCMAKE_SYSTEM_LIBRARY_PATH=$PREFIX/lib \
    .. \
    && make && make install
