#!/bin/sh
# author:wangzhongqiu

#单引号
# 单引号字符串的限制：单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；单引号字串中不能出现单引号（对单引号使用转义符后也不行）。
str='This is a string'
echo str

#双引号
your_name="wangzhongqiu"
echo "i know your name are \"${your_name}\"!"

#拼接字符串
greeting="hello,"$your_name"!"
greeting1="hello,${your_name}!"
echo $greeting, $greeting1

#获取字符串长度
echo ${#your_name}

#提取子字符串
echo ${your_name:1:3

