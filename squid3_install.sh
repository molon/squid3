#!/bin/bash
/usr/bin/apt update
/usr/bin/apt -y install apache2-utils squid3
/usr/bin/htpasswd -b -c /etc/squid/passwd $SQUID_USER $SQUID_PASSWORD
/bin/rm -f /etc/squid/squid.conf
/usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/molon/squid3/master/squid.conf
/sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
/sbin/iptables-save
service squid restart
update-rc.d squid defaults