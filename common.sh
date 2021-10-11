#!/bin/bash

DEFAULT_DIR=~/Documents/nfd

# ndn-cxx
NDN_CXX_VERSION=0.7.1

# nfd
NDN_NFD_VERSION=0.7.1
WEB_SOCKET_PP_VERSION=0.8.1-hotfix 

# NLSR
CHRONO_SYNC_VERSION=0.6.0
PSYNC_VERSION=0.3.0
NLSR_VERSION=0.5.4

# ndn-cpp
NDN_CPP_VERSION=v0.18

# ndn-tools
NDN_TOOLS_VERSION=0.7.1

function ensureDir() {
    dir=$1
    if [[ ! -d "$dir" ]]; then
        echo "文件夹${dir}不存在，正在创建"

        mkdir -p ${dir}
    fi
}

function cloneOrUpdate() {
    cd ${DEFAULT_DIR}
    name=$1
    url=$2
    version=$3
    if [[ ! -d ${name} ]];then          # 项目不存在则为其创建文件夹
        mkdir ${name}
    else
        if [[ ${FORCE_UPDATE} -eq 1 ]]; then        # 强制更新则不管是否版本号相同都更新
            rm -r ${name} ${name}.tar.gz
            mkdir ${name}
        else
            # 得到当前的版本号
            curVersion=$(cat ${name}/VERSION)

            # 版本号不一致则删除原来的，更新新的
            if [[ ${curVersion} != ${version} ]]; then
                echo "${name}版本更新： ${curVersion} -> ${version}"
                rm -r ${name} ${name}.tar.gz
                mkdir ${name}
            else
                echo "${name}已是最新版本，无需更新"
		cd ${name}
                return
            fi
        fi
    fi
    if [[ ! ${FORCE_UPDATE} -eq 2 ]]; then
        curl -L ${url} > ${name}.tar.gz
    fi
    tar xf ${name}.tar.gz -C ${name} --strip 1
    cd ${name}


}

function afterInstall() {
    cd ${DEFAULT_DIR}
    name=$1
    url=$2
    version=$3
    if [[ ! -f ${name}/VERSION ]]; then
        echo "项目没有版本号，输出一个版本号："
        # 有些项目没有版本号，手动输出一个版本号
        echo ${version} > ${name}/VERSION
    fi
}

# 确保Documents文件夹存在
ensureDir ${DEFAULT_DIR}
