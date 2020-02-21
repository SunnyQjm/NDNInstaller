# NDNInstaller

> NDNInstaler 是一个一键安装脚本，用于便捷安装NDN项目组中包含的各个项目（ndn-cxx、NFD、NLSR等等）

- ### 版本说明

  当前脚本中包含的各个库的脚本如下：

  - [ndn-cxx](https://github.com/named-data/ndn-cxx/releases) => 0.7.0
  - [nfd](https://github.com/named-data/NFD/releases) => 0.7.0
    - [websocketpp](https://github.com/cawka/websocketpp/releases) => 0.8.1-hotfix 
  - [ndn-tools](https://github.com/named-data/ndn-tools/releases) => 0.7
  - [NLSR](https://github.com/named-data/NLSR/releases) => 0.5.1
    - [PSync](https://github.com/named-data/PSync/releases) => 0.2.0
    - [ChronoSync](https://github.com/named-data/ChronoSync/releases) => 0.5.3

- ### 自定义版本安装

  所有版本设置都在 `common.sh` 脚本当中，可以自行修改版本号：

  ```bash
  #!/bin/bash
  
  DEFAULT_DIR=~/Documents/nfd
  
  # ndn-cxx
  NDN_CXX_VERSION=0.7.0
  
  # nfd
  NDN_NFD_VERSION=0.7.0
  WEB_SOCKET_PP_VERSION=0.8.1-hotfix 
  
  # NLSR
  CHRONO_SYNC_VERSION=0.5.3
  PSYNC_VERSION=0.2.0
  NLSR_VERSION=0.5.1
  
  # ndn-cpp
  NDN_CPP_VERSION=v0.17
  
  # ndn-tools
  NDN_TOOLS_VERSION=0.7
  ```

  

- ### 安装要求

  - 系统为Ubuntu或者Debain系列系统，支持apt包管理

  - 使用本脚本进行安装之前，要求系统装有boost，boost版本不要太低，建议`15.8`以上，如果想要安装指定版本的boost，建议去官网下载，编译安装，如果没有指定要求，可执行下列代码安装boost：

    ```bash
    sudo apt update
    sudo apt install libboost-all-dev
    sudo ldconfig
    ```

- ### 一键安装

  ```bash
  ./install.sh
  ```

- ### 按需安装

  - ndn-cxx

    ```bash
    ./install_ndn-cxx.sh
    ```

  - ndn-cpp

    ```bash
    ./install_ndn-cpp.sh
    ```

  - nfd

    ```bash
    ./install_ndn-cpp.sh
    ```

  - nlsr

    ```bash
    ./install_nlsr.sh
    ```

  - ndn-tools

    ```bash
    ./install_ndn-tools.sh
    ```

    

