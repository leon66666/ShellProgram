#!/bin/sh

MYSQL_HOST=$1
DB=$2
MYSQL_USER=root
PORT=3306
MYSQL_PASSWORD='password'
SQL_INPUT=`cat /scripts/sql.txt`
SQL_INIT=`cat /scripts/init.txt`


ps -ef|grep tomcat-lend|awk 'NR==1 {print $2}'|xargs kill -9
ps -ef|grep tomcat-web|awk 'NR==1 {print $2}'|xargs kill -9
ps -ef|grep tomcat-mgmt|awk 'NR==1 {print $2}'|xargs kill -9
ps -ef|grep tomcat-schedule|awk 'NR==1 {print $2}'|xargs kill -9
ps -ef|grep core-match|awk 'NR==1 {print $2}'|xargs kill -9
ps -ef|grep core-repay|awk 'NR==1 {print $2}'|xargs kill -9
ps -ef|grep escrow-retry|awk 'NR==1 {print $2}'|xargs kill -9
sleep 5
echo "sleep5"
sleep 5
echo "sleep5"
sleep 5



