#!/usr/bin/env bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
	let CORES=`grep -c ^processor /proc/cpuinfo`
	;;
    Darwin*)
	let CORES=`sysctl -n hw.ncpu`
	;;
    *)  echo "${unameOut} unsupported"; exit 1
esac

mkdir build
cd build
cmake -DCONDA_BUILD=TRUE -DCMAKE_INSTALL_PREFIX=$PREFIX -DDEPLOYMENT_PREFIX=$PREFIX .. && make -j $CORES && make install
