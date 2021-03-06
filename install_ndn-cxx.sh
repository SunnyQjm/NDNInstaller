#!/bin/bash

# 通用的函数定义和变量定义

source ./common.sh

# install ndn-cxx prerequesites
sudo apt install build-essential libsqlite3-dev libssl-dev curl tar -y
sudo apt install doxygen graphviz python3-pip -y
sudo pip3 install sphinx sphinxcontrib-doxylink

# install ndn-cxx
cloneOrUpdate ndn-cxx https://github.com/named-data/ndn-cxx/archive/ndn-cxx-${NDN_CXX_VERSION}.tar.gz ${NDN_CXX_VERSION}
./waf configure --enable-static --with-examples
./waf
sudo ./waf install
afterInstall ndn-cxx https://github.com/named-data/ndn-cxx/archive/ndn-cxx-${NDN_CXX_VERSION}.tar.gz ${NDN_CXX_VERSION}

sudo ldconfig
