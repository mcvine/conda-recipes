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

PYVER_MAJOR=`python -c "import sys; print sys.version_info[0]"`
PYVER_MINOR=`python -c "import sys; print sys.version_info[1]"`
PYVER=${PYVER_MAJOR}.${PYVER_MINOR}

mkdir build
cd build
cmake -DCONDA_BUILD=TRUE \
      -DCMAKE_INSTALL_PREFIX=$PREFIX -DDEPLOYMENT_PREFIX=$PREFIX \
      -DPYTHON_LIBRARY=${PREFIX}/lib/libpython${PYVER}.${SHAREDLIB} \
      -DPYTHON_INCLUDE_DIR=${PREFIX}/include/python${PYVER} \
      .. \
    && make && make install
