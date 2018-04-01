#!/bin/bash

/etc/init.d/rpcbind stop

#Trigger service start
/etc/init.d/rpcbind start
/etc/init.d/vsftpd start
/etc/init.d/tftpd-hpa start
/etc/init.d/mysql start
/etc/init.d/nfs-kernel-server start
/usr/sbin/apachectl -D FOREGROUND

#If the commands above do not trigger the service start for some reason
rpcbind
service nfs-kernel-server start