#!/bin/bash
## Database user and password must be included in the variables DB_USER, DB_PASS and DB_NAME
echo "loading"
DB_HOSTNAME=`echo $DB_PORT | cut -f3 -d/ | cut -f1 -d:`
DB_PORT_INT=`echo $DB_PORT | cut -f3 -d:`
DB_NAME_INT=${DB_NAME:-"fog"}
DB_USER_INT=${DB_USER:-"root"}
DB_PASS_INT=${DB_PASS:-""}
DB_EXISTS=`mysql -h $DB_HOSTNAME -u $DB_USER_INT -p$DB_PASS_INT --skip-column-names -e "SHOW DATABASES LIKE '$DB_NAME_INT'"`
sed -i "s/define('DATABASE_HOST', 'localhost');/define('DATABASE_HOST', '$DB_HOSTNAME');/g" /var/www/fog/lib/fog/config.class.php
sed -i "s/define('DATABASE_NAME', 'fog');/define('DATABASE_NAME', '$DB_NAME_INT');/g" /var/www/fog/lib/fog/config.class.php
sed -i "s/define('DATABASE_USERNAME', 'root');/define('DATABASE_USERNAME', '$DB_USER_INT');/g" /var/www/fog/lib/fog/config.class.php
sed -i "s/define('DATABASE_PASSWORD', '');/define('DATABASE_PASSWORD', '$DB_PASS_INT');/g" /var/www/fog/lib/fog/config.class.php
#patch ipservice
echo "mountd 34463/tcp" >> /etc/services
echo "mountd 34463/udp" >> /etc/services
#patch Autostart
echo "service apache2 start" >>/etc/bash.bashrc
echo "in.tftpd --listen --address 0.0.0.0:69 -s /tftpboot" >>/etc/bash.bashrc
echo "/usr/bin/freshclam -d --quiet" >>/etc/bash.bashrc
echo "rpcbind" >>/etc/bash.bashrc
#patch PXE
#file: /tftpboot/default.ipxe