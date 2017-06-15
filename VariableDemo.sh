#!/bin/sh
# author:wangzhognqiu
#执行 ./VariableDemo.sh "a" "b" "c" "d"，看到执行结果

# $$用来获取当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID。
echo $$

#普通变量
myUrl="http://see.xidian.edu.cn/cpp/linux/"
echo ${myUrl}

# $0用来获取当前脚本的文件名
echo "File Name: $0"

# $n获取传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2。
echo "First Parameter : $1"
echo "First Parameter : $2"

# $#传递给脚本或函数的参数个数。
echo "Total Number of Parameters : $#"

#特殊变量$* 和 $@ 都表示传递给函数或脚本的所有参数，不被双引号(" ")包含时，都以"$1" "$2" … "$n" 的形式输出所有参数。
#但是当它们被双引号(" ")包含时，"$*" 会将所有的参数作为一个整体，以"$1 $2 … $n"的形式输出所有参数；"$@" 会将各个参数分开，以"$1" "$2" … "$n" 的形式输出所有参数。
echo "\$*=" $*
echo "\"\$*\"=" "$*"
echo "\$@=" $@
echo "\"\$@\"=" "$@"

echo "print each param from \$*"

for var in $*
do
    echo "$var"
done
echo "print each param from \$@"
for var in $@
do
    echo "$var"
done
echo "print each param from \"\$*\""
for var in "$*"
do
    echo "$var"
done
echo "print each param from \"\$@\""
for var in "$@"
do
    echo "$var"
done

#特殊变量$? 可以获取上一个命令的退出状态。所谓退出状态，就是上一个命令执行后的返回结果。退出状态是一个数字，一般情况下，大部分命令执行成功会返回 0，失败返回 1。不过，也有一些命令返回其他值，表示不同类型的错误。
echo $?
