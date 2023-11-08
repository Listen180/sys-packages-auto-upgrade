#!/bin/bash
# *********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2021-09-06 12:54
# * Last modified : 2023-10-11 14:05
# * Filename      : sys_packages_auto_upgrade.sh
# * Description   : 
# *********************************************************

CWD=$(cd `dirname $0`; pwd)
#echo ${CWD}
ctime=`date +%Y-%m-%d_%H-%M-%S`
logFile="${CWD}/logs/auto_upgrade_${ctime}.log"

OS="Unknown"
OS=$(hostnamectl | grep "Operating System" | awk -F ':' '{print $2}')
OS_l=$(echo ${OS} | tr '[:upper:]' '[:lower:]')

PKG="Unknown"
if [[ "${OS}" == *"Ubuntu"* ]]; then
    PKG="apt"
elif [[ "${OS}" == *"Debian"* ]]; then
    PKG="apt"
elif [[ "${OS}" == *"CentOS"* ]]; then
    PKG="yum"
else
    echo "[Abort] OS info Unknown! [${OS}]"  >> ${logFile} 2>&1
    exit 0
fi

echo "OS: ${OS}"
echo "OS_l: ${OS_l}"
