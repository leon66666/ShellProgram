#!/bin/sh
#author:wangzhongqiu


#for循环
for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done


for str in 'This is a string'
do
    echo $str
done

for FILE in /opt/bin/.sh*
do
   echo $FILE
done


#while循环
COUNTER=0
while [ $COUNTER -lt 5 ]
do
    COUNTER='expr $COUNTER+1'
    echo $COUNTER
done

echo 'type <CTRL-D> to terminate'
echo -n 'enter your most liked film: '
while read FILM
do
    echo "Yeah! great film the $FILM"
    break
done


#util循环
#until 循环执行一系列命令直至条件为 true 时停止。until 循环与 while 循环在处理方式上刚好相反。一般while循环优于until循环，但在某些时候，也只是极少数情况下，until 循环更加有用。
#使用 until 命令输出 0 ~ 9 的数字：
a=0
until [ ! $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
done


#break跳出循环
#break命令允许跳出所有循环（终止执行后面的所有循环）。在嵌套循环中，break 命令后面还可以跟一个整数，表示跳出第几层循环。例如 break 2

while :
do
    echo -n "Input a number between 1 to 5: "
    read aNum
    case $aNum in
        1|2|3|4|5) echo "Your number is $aNum!"
        ;;
        *) echo "You do not select a number between 1 to 5, game is over!"
            break
        ;;
    esac
done

for var1 in 1 2 3
do
   for var2 in 0 5
   do
      if [ $var1 -eq 2 -a $var2 -eq 0 ]
      then
         break 2
      else
         echo "$var1 $var2"
      fi
   done
done

#continue跳出循环
#continue命令与break命令类似，只有一点差别，它不会跳出所有循环，仅仅跳出当前循环。同样，continue 后面也可以跟一个数字，表示跳出第几层循环。

while :
do
    echo -n "Input a number between 1 to 5: "
    read aNum
    case $aNum in
        1|2|3|4|5) echo "Your number is $aNum!"
        ;;
        *) echo "You do not select a number between 1 to 5!"
            continue
            echo "Game is over!"
        ;;
    esac
done

NUMS="1 2 3 4 5 6 7"
for NUM in $NUMS
do
   Q=`expr $NUM % 2`
   if [ $Q -eq 0 ]
   then
      echo "Number is an even number!!"
      continue
   fi
   echo "Found odd number"
done
