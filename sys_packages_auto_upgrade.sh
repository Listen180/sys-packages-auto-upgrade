# 
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

OS=$(hostnamectl | grep "Operating System" | awk -F ':' '{print $2}') || OS="Unknown"

PKG="Unknown"
if [[ ${OS} == '*Ubuntu*' ]]; then
    PKG="apt"
elif [[ ${OS} == '*Debian*' ]]; then
    PKG="apt"
elif [[ ${OS} == '*Centos*' ]]; then
    PKG="yum"
fi

if [[ ${PKG} == 'apt' ]]; then
    apt-get update > ${logFile} 2>&1
    echo -e "\n\n" >> ${logFile} 2>&1
    apt-get upgrade -y >> ${logFile} 2>&1
elif [[ ${PKG} == 'yum' ]]; then
    yum update > ${logFile} 2>&1
    echo -e "\n\n" >> ${logFile} 2>&1
    yum upgrade -y >> ${logFile} 2>&1
else
    echo "[Abort] PKG info Unknown!"  >> ${logFile} 2>&1
    exit 0
fi
