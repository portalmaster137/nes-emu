#!/bin/bash

export SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

export BUILD_TYPE=Release
#export BUILD_TYPE=Debug

cd $SCRIPT_DIR
mkdir build_gcc
cd build_gcc
export CC=`which gcc`
export CXX=`which g++`
cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE ..
make -j VERBOSE=1