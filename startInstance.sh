#!/bin/sh

/etc/init.d/rpcbind stop
#Setup PXE boot
cp /tftpboot/default.ipxe /tftpboot/default.ipxe.tmp
sed '$ d' /tftpboot/default.ipxe.tmp > /tftpboot/default.ipxe
rm -f /tftpboot/default.ipxe.tmp
echo "chain http://$PXEext/fog/service/ipxe/boot.php##params" >> /tftpboot/default.ipxe

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