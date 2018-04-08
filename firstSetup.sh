#!/bin/sh
## Database user and password must be included in the variables DB_USER, DB_PASS and DB_NAME
/etc/init.d/rpcbind start
/etc/init.d/vsftpd start
/etc/init.d/mysql start
/usr/sbin/apachectl -D FOREGROUND
#patch ipservice
echo "mountd 34463/tcp" >> /etc/services
echo "mountd 34463/udp" >> /etc/services
#patch Autostart
echo "service apache2 start" >>/etc/bash.bashrc
echo "in.tftpd --listen --address 0.0.0.0:69 -s /tftpboot" >>/etc/bash.bashrc
echo "/usr/bin/freshclam -d --quiet" >>/etc/bash.bashrc
echo "rpcbind" >>/etc/bash.bashrc
