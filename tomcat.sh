#!/bin/sh

function tomcat_bin {
  if [[ $2 = "stop" ]]; then
  	echo "do_stop $1"
  elif [[ $2 = "restart" ]]; then
  	echo "do_restart $1"
  fi
#	if [[ $1 = "web" ]]; then
#		./nginx-web.sh 8072
#	elif [[ $1 = "web2" ]]; then
#		./nginx-web.sh 8071
#	fi
  pid=`ps aux | egrep java.*tomcat.*$1/.*Bootstrap | grep -v grep | awk '{print $2}' | head -1`
  echo "/opt/tomcat-$1/bin/shutdown.sh"
  /opt/tomcat-$1/bin/shutdown.sh
  sleep 5
  pid=`ps aux | egrep java.*tomcat.*$1/.*Bootstrap | grep -v grep | awk '{print $2}' | head -1`
  if [[ -n "$pid" ]]; then
    echo "Cannot stop $1, kill -9 $pid"
    kill -9 $pid
  fi
	if [[ $2 = "restart" ]]; then
	  echo "/opt/tomcat-$1/bin/startup.sh"
	  /opt/tomcat-$1/bin/startup.sh
	fi
#	if [[ $1 = "web" ]]; then
#		sleep 75
#		tomcat_bin web2 $2
#	fi
}

if [[ $# != 2 ]] ; then
	echo "USAGE: $0 servername [stop|restart]"
	echo " e.g.: $0 web restart"
	exit 1;
fi
tomcat_bin $1 $2
