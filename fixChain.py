#!/usr/bin/python'
import os

print "Applying all IP and INTERFACE values"
print "RCV ip: "+str(os.environ['EXTIP'])

##PHP chain
with open('\tftpboot\default.ipxe', 'r') as file:
    data = file.readlines()

for i in range(0,len(data)):
	if "chain" in data[i]:
		data[i] = "chain http://" + str(os.environ['EXTIP']) + "/fog/service/ipxe/boot.php##params"
		
with open('\tftpboot\default.ipxe', 'w') as file:
    file.writelines( data )
	
##PHP config TFTP/WEB
with open('\tftpboot\default.ipxe', 'r') as file:
    data = file.readlines()

for i in range(0,len(data)):
	#IP
	if "TFTP_HOST" in data[i]:
		data[i] = "define('TFTP_HOST', \""  + str(os.environ['EXTIP']) + "\");"
	if "WOL_HOST" in data[i]:
		data[i] = "define('WOL_HOST', \""  + str(os.environ['EXTIP']) + "\");"
	if "WEB_HOST" in data[i]:
		data[i] = "define('WEB_HOST', \""  + str(os.environ['EXTIP']) + "\");"	
	#INTERFACE
	if "WOL_INTERFACE" in data[i]:
		data[i] = "define('WOL_INTERFACE', \"eth0\");"
	if "NFS_ETH_MONITOR" in data[i]:
		data[i] = "define('NFS_ETH_MONITOR', \"eth0\");"
	if "UDPCAST_INTERFACE" in data[i]:
		data[i] = "define('UDPCAST_INTERFACE', \"eth0\");"
with open('/var/www/fog/lib/fog/config.class.php', 'w') as file:
    file.writelines( data )