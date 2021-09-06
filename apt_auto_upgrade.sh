# 
# *********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2021-09-06 12:54
# * Last modified : 2021-09-06 12:54
# * Filename      : apt_auto_upgrade.sh
# * Description   : 
# *********************************************************

CWD=$(cd `dirname $0`; pwd)
#echo ${CWD}
ctime=`date +%Y-%m-%d_%H-%M-%S`
logFile="${CWD}/logs/auto_upgrade_${ctime}.log"

apt-get update > ${logFile} 2>&1
echo "\n" >> ${logFile} 2>&1
apt-get upgrade -y >> ${logFile} 2>&1

