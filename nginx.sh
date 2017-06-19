#!/bin/sh


case $1 in
8071)
	if [ ! -f "/etc/nginx/conf.d/8071.conf" ]; then
		sudo mv /etc/nginx/conf.d/8071.conf.tmp /etc/nginx/conf.d/8071.conf
		sudo mv /etc/nginx/conf.d/8072.conf /etc/nginx/conf.d/8072.conf.tmp
	fi
;;
8072)
	if [ ! -f "/etc/nginx/conf.d/8072.conf" ]; then
		sudo mv /etc/nginx/conf.d/8072.conf.tmp /etc/nginx/conf.d/8072.conf
		sudo mv /etc/nginx/conf.d/8071.conf /etc/nginx/conf.d/8071.conf.tmp
	fi
;;
esac
# sudo /usr/sbin/nginx -t
sudo /usr/sbin/nginx -s reload
echo "switched to port $1"
