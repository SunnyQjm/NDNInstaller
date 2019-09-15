#!/bin/bash

# 通用的函数定义和变量定义

source ./common.sh

NDN_TOOLS_VERSION=0.6.4

# install ndn-tools
sudo apt-get install libpcap-dev -y
cloneOrUpdate ndn-tools https://github.com/named-data/ndn-tools/archive/ndn-tools-${NDN_TOOLS_VERSION}.tar.gz ${NDN_TOOLS_VERSION}
./waf configure
./waf
sudo ./waf install
afterInstall ndn-tools https://github.com/named-data/ndn-tools/archive/ndn-tools-${NDN_TOOLS_VERSION}.tar.gz ${NDN_TOOLS_VERSION}


sudo ldconfig
