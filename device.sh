#!/bin/bash

#this is printed and user choose handle function.
screen() {
    echo -e "\n================= [ Dev--ice ] ================="
    if [[ ${time} -eq 0 ]]; then
        echo "Let me look, how many you have...... (Ctrl+C || '0000' exit)"
        time=1
    fi
    blkid > /home/kali/device.txt
    python /home/kali/Desktop/.script/device/device.py device
    devicename=$(python /home/kali/Desktop/.script/device/device.py name)
    maxnumber=$(python /home/kali/Desktop/.script/device/device.py number)
    echo "================================================"
    echo "Please input your device section."
    read -p "devs(Space-separated): " dev
    if [[ ${dev} == "0000" ]]; then
        exit 0
    fi
    while true; do
        if [[ -z ${dev:-} ]]; then
            echo "1sorry,not right device number in. Please re-put. (Ctrl+C || input '0000' exit)"
            read -p "Please re-put devs(Space-separated): " dev
            if [[ ${dev} == "0000" ]]; then
                exit 0
            fi
        else
            while true; do
                userchoose=$(python /home/kali/Desktop/.script/device/device.py rangein ${maxnumber} ${dev})
                if [[ ${userchoose} == "None" ]]; then
                    echo -e "Qualified Area is:  ${userchoose}\n"
                    read -p "Please re-put devs(Space-separated): " dev
                    if [[ -z ${dev:-} ]]; then
                        echo "sorry,not right device number in. Please re-put. (Ctrl+C || input '0000' exit)"
                        read -p "Please re-put devs(Space-separated): " dev
                        if [[ ${dev} == "0000" ]]; then
                            exit 0
                        fi
                    fi
                else
                    echo -e "Qualified Area is:  ${userchoose}\n"
                fi
                if [[ ${userchoose} != "None" ]]; then
                    break
                fi
            done
        fi
        if [[ ${dev} == "0000" ]]; then
            exit 0
        fi
        if [[ ${userchoose:-} && ${userchoose} != "None" ]]; then
            break
        fi
    done
}

#this is directory check function.
directory() {
    echo "================ [device  root] ================"
    echo "Don't worry, we will create the directory."
    read -p "Please input a device root directory:  " -a dir
    dir=${dir[0]}
    if [[ -d ${dir} ]]; then
        re=0
        while true; do
            if [[ ${re} -eq 0 ]]; then
                echo "device root directory is find."
                dir=$(realpath ${dir})
                echo "device root direvtory is: ==> ${dir}"
                re=1
            else
                read -p "Please re-put a device root directory:  " -a dir
                dir=${dir[0]}
            fi
            if [[ -d ${dir} ]]; then
                read -p "yes/no?   " jbm
                if [[ -z ${jbm:-} || ${jbm} == "yes" ]]; then
                    dir=$(realpath ${dir})
                    echo "device root direvtory is: ==> ${dir}"
                    break
                fi            
            fi
        done
    else
        while true; do
            read -p "Please re-put a device root directory:  " -a dir
            dir=${dir[0]}
            if [[ -d ${dir} ]]; then
                dir=$(realpath ${dir})
                echo "device root direvtory is: ==> ${dir}"
                read -p "yes/no?   " jbm
                if [[ -z ${jbm:-} || ${jbm} == "yes" ]]; then
                    dir=$(realpath ${dir})
                    echo "device root direvtory is: ==> ${dir}"
                    break
                fi
            else
                echo "directory not finded. Please re-put"
            fi
        done
    fi
}

#mount function
mountloop() {
    echo "================ [ dev  mount ] ================"
    echo "device mount in: ${dir}"
    echo "user choose: ${userchoose}"
    mountroot=($(python /home/kali/Desktop/.script/device/device.py path ${dir} ${userchoose}))
    for ((i=0; i<${#mountroot[@]}; i+=2)); do
        mdir=${mountroot[i]}
        mdev=${mountroot[i+1]}
        if [[ ! -d ${mdir} ]]; then
            sudo mkdir ${mdir} && echo "directory ${mdir} make Complete." || echo "directory ${mdir} creat failed."
        fi
        sudo mount ${mdev} ${mdir} && echo "device ${mdev} mount Complete." && echo "${mdev}" > /home/kali/mdev.txt && wish=true || { echo "Error: mount"; exit 1; }
    done
}

#loop main
exe() {
    case ${1} in
        start|begin|on)
            screen
            directory
            mountloop
            wish=${wish:=false}
            if ${wish}; then
                echo "================================================"
                echo -e "\nComplete, wish you have a good day!"
            else
                echo "maybe something Error..."
            fi
            ;;
        end|off)
            file="/home/kali/mdev.txt"
            while read i; do
                sudo umount ${i}
                echo "${i} unmount"
            done < "${file}"
            echo "Good bye!"
            ;;
        *)
            echo -e "\nPlease input start or end"
            echo "maybe you should try mount or umount..."
        ;;
    esac
}

#start
exe $1

#readme
: <<"readme"
这是我的第一个相对完善的脚本
我非常高兴
下面我将讲讲我定义的变量及作用
挂载目录与挂载权限请自行修改

SHELL部分内容：
time        ==> 一个辅助提示变量，无作用。
devicename  ==> 通过python获取设备名称
maxnumber   ==> 通过python获取最大设备数
dev         ==> 选择的设备编号
userchoose  ==> 根据设备编号判断选择的具体设备
dir         ==> 输入的设备挂载目录
re          ==> 一个辅助提示变量，无作用
jbm         ==> 一个验证变量，提醒用户检查输入
mountroot   ==> 通过python输出挂载设备与设备挂载目录
i           ==> 无
mdev        ==> 挂载设备
mdir        ==> 挂载路径
$1          ==> 传入第一个脚本参数进行开始选择
wish        ==> 提示语
file        ==> 文件路径

PYTHON部分内容：
Device()    ==> 通过硬编写文件读取位置读取并生成 device「设备列表」 与 result「打印列表」 输出到终端显示
userchoose  ==> 通过传入的 maxnumber「设备大小」与dev「选择设备」 参数进行选择设备判断
path        ==> 通过传入的 dir「挂载根目录」与userchoose「选择设备」 生成挂载目录
exe         ==> 判断程序，python调用格式：「自定义名称」=($(python /home/kali/Desktop/.script/device/device.py 「调用函数」 「传入参数」))
注意：因为会用到python进行设备名读取，所以设备信息被存储在 /home/device.txt 中。
             可自行修改
             自行修改，可能造成意料之外的破坏。（因为我的系统为kali，默认root）
readme
