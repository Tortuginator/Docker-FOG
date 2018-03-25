#!/bin/sh

/etc/init.d/rpcbind start
/etc/init.d/vsftpd start
/etc/init.d/tftpd-hpa start
/etc/init.d/mysql start
/etc/init.d/nfs-kernel-server start
/usr/sbin/apachectl -D FOREGROUND