#!/bin/bash

####################################################
######## 本脚本用于安装运行NFD需要的环境
###################################################$
FORCE_UPDATE=$1

./install_ndn-cxx.sh
./install_nfd.sh
./install_Psync.sh
./install_ChronoSync.sh
./install_nlsr.sh
./install_ndn-tools.sh
./install_ndn-cpp.sh
