#!/bin/bash

#keyevent：首页3；电源26；右22；确认66；

# 关闭电视
closeTV(){
    echo "ADB电视关机中"
    IP=$1
    echo ${IP}
    #!<<EOF
    adb -s ${IP}:5555 shell input keyevent 3
    adb -s ${IP}:5555 shell input keyevent 26
    adb -s ${IP}:5555 shell input keyevent 22
    adb -s ${IP}:5555 shell input keyevent 22
    adb -s ${IP}:5555 shell input keyevent 66
    #EOF
    echo "ADB电视关机完成"
}

# 打开电视
openTV(){
    echo "ADB电视开机进行"
    IP=$1
    echo ${IP}
    #!<<EOF
    adb -s ${IP}:5555 shell input keyevent 3
    adb -s ${IP}:5555 shell input keyevent 66
    #EOF
    echo "ADB电视关机完成"
}


# 参数1：ADB电视IP
# 参数2：操作：开机open；关机close
TVIP=$1
ACTION=$2
DATE=`date "+%Y-%m-%d %H:%M:%S"`

echo "-----函数开始执行-----$DATE"
adb devices
adb connect ${TVIP}:5555

if   [ $ACTION == "open"  ];then
    openTV $TVIP
elif [ $ACTION == "close" ];then
    closeTV $TVIP
fi
echo "-----函数执行完毕-----"
