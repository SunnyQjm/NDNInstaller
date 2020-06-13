#!/bin/bash

source ./common.sh


function doUninstallIfExists() {
    cd ${DEFAULT_DIR}
    name=$1
    way=$2
    if [[ ! -d ${name} ]]; then
        echo ${name}" 没有安装，无需卸载"
    else
        cd ${name}
        if [[ ${way} -eq 1 ]];then
            sudo ./waf uninstall
        elif [[ ${way} -eq 2 ]];then
            sudo make uninstall
        fi
    fi
}

function deleteIfExists() {
    filePath=$1
    if [[ -d ${filePath} ]];then
        sudo rm -r ${filePath}
    fi
}

deleteIfExists /usr/local/etc/ndn
deleteIfExists /var/lib/nlsr

# uninstall ndn-cxx if exists
echo "begin uninstall ndn-cxx"
doUninstallIfExists ndn-cxx 1
echo "end uninstall ndn-cxx"


# uninstall nfd
echo "begin uninstall NFD"
doUninstallIfExists NFD 1
echo "end uninstall NFD"

# uninstall ChronoSync
echo "begin uninstall ChronoSync"
doUninstallIfExists ChronoSync 1
echo "end uninstall ChronoSync"

# uninstall Psync
echo "begin uninstall PSync"
doUninstallIfExists PSync 1
echo "end uninstall PSync"

# uninstall nlsr
echo "begin uninstall NLSR"
doUninstallIfExists NLSR 1
echo "end uninstall NLSR"

# uninstall ndn-cpp
echo "begin uninstall ndn-cpp"
doUninstallIfExists ndn-cpp 2
echo "end uninstall ndn-cpp"

# uninstall ndn-tools
echo "begin uninstall ndn-tools"
doUninstallIfExists ndn-tools 1
echo "end uninstall ndn-tools"


deleteIfExists /usr/local/include/ndnboost
deleteIfExists /usr/local/include/ndn-cpp
deleteIfExists /usr/local/include/ndn-cpp-tools
deleteIfExists /usr/local/include/PSync

cd -
