#!/bin/bash

# 通用的函数定义和变量定义

source ./common.sh

NDN_NFD_VERSION=0.6.6
WEB_SOCKET_PP_VERSION=0.8.1

# install nfd prerequesites
sudo apt-get install build-essential pkg-config valgrind libsystemd-dev \
                     libsqlite3-dev libssl-dev libpcap-dev -y
sudo apt-get install doxygen graphviz python-sphinx -y

# install nfd
sudo apt-get install build-essential pkg-config valgrind libsystemd-dev \
                     libsqlite3-dev libssl-dev libpcap-dev -y
sudo apt-get install doxygen graphviz python-sphinx -y
cloneOrUpdate NFD https://github.com/named-data/NFD/archive/NFD-${NDN_NFD_VERSION}.tar.gz ${NDN_NFD_VERSION}
mkdir websocketpp
curl -L https://github.com/zaphoyd/websocketpp/archive/${WEB_SOCKET_PP_VERSION}.tar.gz > websocket.tar.gz
tar xf websocket.tar.gz -C websocketpp/ --strip 1
./waf configure
./waf
sudo ./waf install
afterInstall NFD https://github.com/named-data/NFD/archive/NFD-${NDN_NFD_VERSION}.tar.gz ${NDN_NFD_VERSION}

# 配置文件
# check nfd.conf exists?
if [[ ! -f /usr/local/etc/ndn/nfd.conf ]];then
    cd /usr/local/etc/ndn
    sudo cp nfd.conf.sample nfd.conf
fi

sudo ldconfig
