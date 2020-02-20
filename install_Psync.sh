#!/bin/bash

# 通用的函数定义和变量定义

source ./common.sh

# install PSync
cloneOrUpdate PSync https://github.com/named-data/PSync/archive/${PSYNC_VERSION}.tar.gz ${PSYNC_VERSION}
./waf configure
./waf
sudo ./waf install
afterInstall PSync https://github.com/named-data/PSync/archive/${PSYNC_VERSION}.tar.gz ${PSYNC_VERSION}

sudo ldconfig
