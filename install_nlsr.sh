#!/bin/bash

# 通用的函数定义和变量定义

source ./common.sh

source ./install_Psync.sh

source ./install_ChronoSync.sh

# install NLSR
cloneOrUpdate NLSR https://github.com/named-data/NLSR/archive/NLSR-${NLSR_VERSION}.tar.gz ${NLSR_VERSION}
./waf configure
./waf
sudo ./waf install
afterInstall NLSR https://github.com/named-data/NLSR/archive/NLSR-${NLSR_VERSION}.tar.gz ${NLSR_VERSION}

#check nlsr.conf exists?
if [[ ! -f /usr/local/etc/ndn/nlsr.conf ]];then
    cd /usr/local/etc/ndn
    sudo cp nlsr.conf.sample nlsr.conf
fi

#check /var/lib/nlsr exists?
if [[ ! -d /var/lib/nlsr ]];then
    sudo mkdir /var/lib/nlsr
fi

sudo ldconfig



