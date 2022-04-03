#!/bin/bash

# set -eux

# 本脚本安装pwndbg和peda使用的是gitee，避免连接不上github的问题
# 个人gitee账户

# 以下是对set参数做出解释
<<COMMENT
	-a 　标示已修改的变量，以供输出至环境变量。
	-b 　使被中止的后台程序立刻回报执行状态。
	-C 　转向所产生的文件无法覆盖已存在的文件。
	-d 　Shell预设会用杂凑表记忆使用过的指令，以加速指令的执行。使用-d参数可取消。
	-e 　若指令传回值不等于0，则立即退出shell。
	-f　 　取消使用通配符。
	-h 　自动记录函数的所在位置。
	-H Shell 　可利用"!"加<指令编号>的方式来执行history中记录的指令。
	-k 　指令所给的参数都会被视为此指令的环境变量。
	-l 　记录for循环的变量名称。
	-m 　使用监视模式。
	-n 　只读取指令，而不实际执行。
	-p 　启动优先顺序模式。
	-P 　启动-P参数后，执行指令时，会以实际的文件或目录来取代符号连接。
	-t 　执行完随后的指令，即退出shell。
	-u 　当执行时使用到未定义过的变量，则显示错误信息。
	-v 　显示shell所读取的输入值。
	-x 　执行指令后，会先显示该指令及所下的参数。
	+<参数> 　取消某个set曾启动的参数。
COMMENT
echo "==========================================================================="
echo "Author : Micros0ft "
echo
echo "Github : " #输入gitee clone 地址
echo 
echo "python3, python2, pwntools, gdb, pwndbg, expect 集成自动安装"
echo "==========================================================================="
echo 

echo "开始安装···"

# echo -e "\033[31m 红色字 \033[0m" 
# 更新apt-get
echo "+-------------------------------------------------------------------------+"
echo -e "\033[31m update apt-get  更新apt-get \033[0m"
echo "+-------------------------------------------------------------------------+"
sudo apt-get update

# 安装 libc6-i386
echo "+-------------------------------------------------------------------------+"
echo -e "\033[31m libc6-i386 \033[0m"
echo "+-------------------------------------------------------------------------+"
sudo apt-get -y install libc6-i386

# 安装pwntools
echo "+-------------------------------------------------------------------------+"
echo -e "\033[31m pip3 和 pip2 安装pwntools \033[0m"
echo "+-------------------------------------------------------------------------+"
pip3 install pwntools
pip2 install pwntools

# 安装git
echo "+-------------------------------------------------------------------------+"
echo -e "\033[31m libc6-i386 \033[0m"
echo "+-------------------------------------------------------------------------+"
sudo apt-get install gdb

# 安装gdb
echo "+-------------------------------------------------------------------------+"
echo -e "\033[31m 安装gdb \033[0m"
echo "+-------------------------------------------------------------------------+"
sudo apt-get install gdb

# 安装gdb插件
echo "+-------------------------------------------------------------------------+"
echo -e "\033[31m 安装gdb \033[0m"
echo "+-------------------------------------------------------------------------+"
# 安装 pwndbg
git clone https://gitee.com/ahsh14/pwndbg.git ~/pwndbg
cd ~/pwndbg
./setup.sh
# 如果使用 pwndbg 需要把下行注释放开
# echo "source ~/pwndbg/gdbinit.py" >> ~/.gdbinit

# 安装 peda
git clone https://gitee.com/lhaisu/peda.git ~/peda
# 如果使用 pwndbg 需注释下行
echo "source ~/peda/peda.py" >> ~/.gdbinit

# 设置gdb反汇编模式
echo "+-------------------------------------------------------------------------+"
echo -e "\033[31m 设置intel模式的汇编代码 \033[0m"
echo "+-------------------------------------------------------------------------+"

echo "set disassembly-flavor intel" >> ~/.gdbinit

# download the libc source to current directory(you can use gdb with this example command: directory ~/glibc-2.24/malloc/)
sudo apt-get source libc6-dev

# 安装 one_gadget
echo "+-------------------------------------------------------------------------+"
echo -e "\033[31m 安装 one_gadget \033[0m"
echo "+-------------------------------------------------------------------------+"

sudo apt-get -y install ruby
sudo gem install one_gadget


# download 
git clone https://gitee.com/zhangbo123321/libc-database.git ~/libc-database
echo "是否安装 libc-database (Y/n)?"
read input
if [[ $input = "n" ]] || [[ $input = "N" ]]; then
	echo "you can cd ~/libc-database and run ./get to download the libc at anytime you want"
else
	cd ~/libc-database && ./get
fi

# 安装expect
echo "+-------------------------------------------------------------------------+"
echo -e "\033[31m 安装 expect \033[0m"
echo "+-------------------------------------------------------------------------+"
sudo apt-get install expect

echo "============================================================================"
echo -e "=============\033[31mGood, Enjoy it.\033[0m================================================"
echo "============================================================================"