#!/bin/sh

echo "kill tomcat-web"
ps -ef|grep tomcat-web|awk 'NR==1 {print $2}'|xargs kill -9
echo "kill tomcat-mgmt"
ps -ef|grep tomcat-mgmt|awk 'NR==1 {print $2}'|xargs kill -9
echo "kill tomcat-schedule"
ps -ef|grep tomcat-schedule|awk 'NR==1 {print $2}'|xargs kill -9
echo "kill core-match"
ps -ef|grep core-match|awk 'NR==1 {print $2}'|xargs kill -9
echo "kill core-repay"
ps -ef|grep core-repay|awk 'NR==1 {print $2}'|xargs kill -9
echo "kill escrow-retry"
ps -ef|grep escrow-retry|awk 'NR==1 {print $2}'|xargs kill -9
