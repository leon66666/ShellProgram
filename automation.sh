cd /var/lib/jenkins/workspace/hxb-util/
git pull origin master
mvn clean  install
cd /var/lib/jenkins/workspace/hxb-framework/
git pull origin master
mvn clean install
cd /var/lib/jenkins/workspace/hxb-lend/
git pull origin master
mvn clean install -Pdev
cd /var/lib/jenkins/workspace/hxb-core/
git pull origin master
mvn clean install -Pdev

/opt/bin/tomcat1.sh web2 stop
/opt/bin/tomcat1.sh web2 restart;
sleep 90s
/opt/bin/nginx-web.sh 8072

/opt/bin/tomcat1.sh web stop
/opt/bin/tomcat1.sh web restart;
sleep 80s
/opt/bin/nginx-web.sh 8071
