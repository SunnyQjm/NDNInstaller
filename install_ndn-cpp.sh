#!/bin/bash

# 通用的函数定义和变量定义

source ./common.sh

NDN_CPP_VERSION=v0.16

# install ndn-cpp
sudo apt install build-essential libssl-dev libsqlite3-dev libprotobuf-dev protobuf-compiler \
    liblog4cxx-dev doxygen -y
cloneOrUpdate ndn-cpp https://github.com/named-data/ndn-cpp/archive/${NDN_CPP_VERSION}.tar.gz
./configure
make
sudo make install

sudo ldconfig

