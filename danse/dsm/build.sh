#!/usr/bin/env bash

let CORES=`grep -c ^processor /proc/cpuinfo`
let CORES-=1
if ((CORES < 1)); then
    CORES = 1;
fi

mkdir build
cd build
cmake -DCONDA_BUILD=TRUE -DCMAKE_INSTALL_PREFIX=$PREFIX  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DDEPLOYMENT_PREFIX=$PREFIX .. && make -j $CORES && make install
