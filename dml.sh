#!/bin/bash
stty erase ^H
MYSQL_HOST30=127.0.0.1
MYSQL_HOST24=192.168.1.24
MYSQL_USER=root
PORT=3306
MYSQL_PASSWORD='password'
MYSQL_DATABASE30='hoomxb0 hoomxb26 hoomxb27 hoomxb28 hoomxb29 hoomxb31 hoomxb32 hoomxb34 hoomxb35 hoomxb36'
MYSQL_DATABASE24='hoomxb_anqi hoomxb_hehuanhuan hoomxb_liuyan hoomxb_luzongwei hoomxb_tianye hoomxb_wanghaiyang hoomxb_wanghuidong hoomxb_wangtongkai hoomxb_wangzhongqiu hoomxb_zhaoxiuhuan hoomxb_zhengdongwen'
SQL_INPUT=`cat /scripts/sql.txt`
echo -n -e "\e[32;1m》》请输入您要批量操作的数据库主机地址(24或者30 为空则全部部署):\e[0m"
read host
if [[ $host == '24' ]];then
for database in $MYSQL_DATABASE24
do
echo -e "\e[36;1m---$database\e[0m"
done
elif  [[ $host == '30' ]];then
for database in $MYSQL_DATABASE30
do
echo -e "\e[31;1m---$database\e[0m"
done
else
for i in $MYSQL_DATABASE24
do
mysql -h${MYSQL_HOST24}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} $i -e  "${SQL_INPUT}"
done
for i in $MYSQL_DATABASE30
do
mysql -h${MYSQL_HOST30}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} $i -e  "${SQL_INPUT}"
done
exit 0
fi
#----------------------------------------------------------------------------------------------
echo -n -e "\e[35;1m   》》请输入您要批量操作的数据库名称(提示:为空则部署全部数据库):\e[0m"
read db
case $host in
24)
if [ -z $db ]
then
for i in $MYSQL_DATABASE24
do
mysql -h${MYSQL_HOST24}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} $i -e  "${SQL_INPUT}"
done
else
mysql -h${MYSQL_HOST24}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} $db -e  "${SQL_INPUT}"
fi
;;
30)
if [ -z $db ]
then
for i in $MYSQL_DATABASE30
do
mysql -h${MYSQL_HOST30}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} $i -e  "${SQL_INPUT}"
done
else
mysql -h${MYSQL_HOST30}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} $db -e  "${SQL_INPUT}"
fi
;;
*)
echo "please input dababase_host and database_name!"
esac
