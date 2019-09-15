#!/bin/bash

# 通用的函数定义和变量定义

source ./common.sh

CHRONO_SYNC_VERSION=0.5.2

# install ChronoSync
cloneOrUpdate ChronoSync https://github.com/named-data/ChronoSync/archive/${CHRONO_SYNC_VERSION}.tar.gz ${CHRONO_SYNC_VERSION}
./waf configure
./waf
sudo ./waf install
afterInstall ChronoSync https://github.com/named-data/ChronoSync/archive/${CHRONO_SYNC_VERSION}.tar.gz ${CHRONO_SYNC_VERSION}

sudo ldconfig
