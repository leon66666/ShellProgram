#!/bin/bash
stty erase ^H
MYSQL_HOST30=127.0.0.1
MYSQL_HOST24=192.168.1.24
MYSQL_USER=root
PORT=3306
MYSQL_PASSWORD='password'
MYSQL_DATABASE30='26 27 28 29 31 32 33 34 35 36'
MYSQL_DATABASE24='hoomxb_anqi hoomxb_hehuanhuan hoomxb_liuyan hoomxb_luzongwei hoomxb_tianye hoomxb_wanghaiyang hoomxb_wanghuidong hoomxb_wangtongkai hoomxb_wangzhongqiu hoomxb_zhaoxiuhuan hoomxb_zhengdongwen'
SQL_INPUT=`cat /scripts/sql.txt`
SQL_INIT=`cat /scripts/init.txt`
echo -n -e "\e[32;1m》》请输入您要批量操作的数据库主机地址(24或者30):\e[0m"
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
echo "执行 sql"
#mysql -h${MYSQL_HOST24}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${i} -e "source /scripts/sql.txt"
#mysql -h${MYSQL_HOST24}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${i} -e "source /scripts/init.txt"
done
else
echo "执行 sql"
#mysql -h${MYSQL_HOST24}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${db} -e "source /scripts/sql.txt"
#mysql -h${MYSQL_HOST24}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${db} -e "source /scripts/init.txt"
fi
;;
30)
if [ -z $db ]
then
for i in $MYSQL_DATABASE30
do
echo "192.168.1.${i}"
ssh -l hsadmin 192.168.1.${i} -C "source /etc/profile && /./scripts/kill_all.sh"
sleep 5
echo "hoomxb${i}"
#mysql -h${MYSQL_HOST30}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} "hoomxb"${i} -e  "source /scripts/sql.txt"
#mysql -h${MYSQL_HOST30}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} "hoomxb"${i} -e  "source /scripts/init.txt"
sleep 5
ssh -l hsadmin 192.168.1.${i} -C "source /etc/profile && /./scripts/start_and_init_all.sh"
done
else
echo "192.168.1.${db}"
ssh -l hsadmin 192.168.1.${db} -C "source /etc/profile && /./scripts/kill_all.sh"
sleep 5
echo "hoomxb${db}"
#mysql -h${MYSQL_HOST30}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} "hoomxb"${db} -e  "source /scripts/sql.txt"
#mysql -h${MYSQL_HOST30}  -P${PORT}  -u${MYSQL_USER} -p${MYSQL_PASSWORD} "hoomxb"${db} -e  "source /scripts/init.txt"
sleep 5
ssh -l hsadmin 192.168.1.${db} -C "source /etc/profile && /./scripts/start_and_init_all.sh"
fi
;;
*)
echo "please input dababase_host and database_name!"
esac
