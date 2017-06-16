!/bin/sh
#author:wangzhongqiu

#数组的定义
array=(1 2 3 4)

#还可以单独定义数组的各个分量
array[0]=10

#数组的读取
echo  ${array[0]}
echo  ${array[2]}

#获取数组所有元素  使用@ 或 * 可以获取数组中的所有元素
echo ${array[@]}

#获取数组的长度
echo ${#array[@]}

#获取数组单个元素的长度
echo ${#array[1]}
