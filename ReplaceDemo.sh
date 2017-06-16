#!/bin/sh
# author:wangzhongqiu

#转移字符替换。这里 -e 表示对转义字符进行替换。如果不使用 -e 选项，将会原样输出。可以使用 echo 命令的 -E 选项禁止转义，默认也是不转义的；使用 -n 选项可以禁止插入换行符。
a=10
echo -e "Value of a is $a \n"

#命令替换。命令替换是指Shell可以先执行命令，将输出结果暂时保存，在适当的地方输出。注意是反引号，不是单引号，这个键位于 Esc 键下方。
DATE=`date`
echo "Date is $DATE"
USERS=`who | wc -l`
echo "Logged in user are $USERS"
UP=`date ; uptime`
echo "Uptime is $UP"

#变量替换。变量替换可以根据变量的状态（是否为空、是否定义等）来改变它的值
#   ${var}              变量本来的值
#   ${var:-word}	如果变量 var 为空或已被删除(unset)，那么返回 word，但不改变 var 的值。
#   ${var:+word}	如果变量 var 被定义，那么返回 word，但不改变 var 的值。
#   ${var:=word}	如果变量 var 为空或已被删除(unset)，那么返回 word，并将 var 的值设置为 word。
#   ${var:?message}	如果变量 var 为空或已被删除(unset)，那么将消息 message 送到标准错误输出，可以用来检测变量 var 是否可以被正常赋值。若此替换出现在Shell脚本中，那么脚本将停止运行。

echo ${var:-"Variable is not set"}
echo "1 - Value of var is ${var}"

echo ${var:="Variable is not set"}
echo "2 - Value of var is ${var}"

unset var
echo ${var:+"This is default value"}
echo "3 - Value of var is $var"

var="Prefix"
echo ${var:+"This is default value"}
echo "4 - Value of var is $var"

echo ${var:?"Print this message"}
echo "5 - Value of var is ${var}"
