#!/usr/bin/env bash

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DDEPLOYMENT_PREFIX=$PREFIX  -DCMAKE_SYSTEM_LIBRARY_PATH=$PREFIX/lib .. && make && make install
