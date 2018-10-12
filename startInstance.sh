#!/bin/bash
python /tmp/fixIP.py
mkdir /run/sendsigs.omit.d/ -p
echo "ServerName localhost" | tee /etc/apache2/conf.d/fqdn
/etc/init.d/rpcbind stop
#Trigger service start
/etc/init.d/rpcbind start
/etc/init.d/vsftpd start
/etc/init.d/mysql start
in.tftpd --listen --address 0.0.0.0:69 -s /tftpboot
/usr/sbin/apachectl -D FOREGROUND

