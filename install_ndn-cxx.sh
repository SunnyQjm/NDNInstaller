#!/bin/bash

# 通用的函数定义和变量定义

source ./common.sh

NDN_CXX_VERSION=0.6.6

# install ndn-cxx prerequesites
sudo apt-get install build-essential libsqlite3-dev libssl-dev curl tar -y
sudo apt-get install doxygen graphviz python3-sphinx python3-pip  -y
pip3 install --upgrade pip
pip3 install --upgrade setuptools
sudo pip3 install sphinxcontrib-doxylink sphinxcontrib-googleanalytics

# install ndn-cxx
cloneOrUpdate ndn-cxx https://github.com/named-data/ndn-cxx/archive/ndn-cxx-${NDN_CXX_VERSION}.tar.gz ${NDN_CXX_VERSION}
./waf configure --enable-static --with-examples
./waf
sudo ./waf install
afterInstall ndn-cxx https://github.com/named-data/ndn-cxx/archive/ndn-cxx-${NDN_CXX_VERSION}.tar.gz ${NDN_CXX_VERSION}

sudo ldconfig
