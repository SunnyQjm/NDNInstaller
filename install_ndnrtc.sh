#!/bin/bash

# 通用的函数定义和变量定义

source ./common.sh
NDN_CPP_VERSION=v0.16
NDNRTC_VERSION=v3.0.2


# install pre
echo 'install pre'
sudo apt-get install cmake wget autoconf automake libtool git protobuf-compiler libconfig++-dev libconfig++9v5


cd ${DEFAULT_DIR}
mkdir ndnrtc-env
cd ndnrtc-env
export NDNRTC_ENV=`pwd`



# depot_tools.git
cd $NDNRTC_ENV
echo 'begin install depot_tools to: '`pwd` 
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$PATH:`pwd`/depot_tools
echo 'install depot_tools finished'

# webrtc
cd $NDNRTC_ENV
echo 'begin install webrtc'
mkdir webrtc-checkout
cd webrtc-checkout/
echo 'begin fetch webrtc: '`pwd`
fetch --nohooks webrtc
cd src
git checkout -b branch-heads-59 refs/remotes/branch-heads/59
echo 'do gclient in: '`pwd`
gclient sync
./build/install-build-deps.sh
gn gen out/Default --args='is_debug=false'
ninja -C out/Default

# ndn-cpp
cd $NDNRTC_ENV
echo 'begin install ndn-cpp:'`pwd`
OLD_DEFAULT_DIR=${DEFAULT_DIR}
DEFAULT_DIR=${NDNRTC_ENV}
sudo apt install build-essential libssl-dev libsqlite3-dev libprotobuf-dev protobuf-compiler \
    liblog4cxx-dev doxygen -y

cloneOrUpdate ndn-cpp https://github.com/named-data/ndn-cpp/archive/${NDN_CPP_VERSION}.tar.gz ndn-cpp
mkdir -p build/share
./configure --with-std-shared-ptr=no --with-std-function=no --prefix=$(pwd)/build
make
sudo make install
DEFAULT_DIR=${OLD_DEFAULT_DIR}
echo 'install ndn-cpp finished! => '`pwd`

# install OpenFEC
cd $NDNRTC_ENV
wget http://openfec.org/files/openfec_v1_4_2.tgz
tar -xvf openfec_v1_4_2.tgz && rm openfec_v1_4_2.tgz
mkdir -p openfec_v1.4.2/build && cd openfec_v1.4.2/
wget https://raw.githubusercontent.com/remap/ndnrtc/master/cpp/resources/ndnrtc-openfec.patch && patch src/CMakeLists.txt ndnrtc-openfec.patch
cd build/
cmake .. -DDEBUG:STRING=OFF
make


# install ndnrtc
DEFAULT_DIR=${NDNRTC_ENV}
cloneOrUpdate ndnrtc https://github.com/remap/ndnrtc/archive/${NDNRTC_VERSION}.tar.gz ndnrtc
cd cpp
mkdir -p build/share
echo 'CPPFLAGS="-g -O2 -DWEBRTC_POSIX" CXXFLAGS="-g -O2 -DWEBRTC_POSIX"' >  build/share/config.site
echo NDNCPPDIR=`pwd`/../../ndn-cpp/build/include >> build/share/config.site
echo NDNCPPLIB=`pwd`/../../ndn-cpp/build/lib >> build/share/config.site
echo OPENFECDIR=`pwd`/../../openfec_v1.4.2 >> build/share/config.site
echo WEBRTCDIR=`pwd`/../../webrtc-checkout/src >> build/share/config.site
./configure --prefix=$(pwd)/build
make && make install
