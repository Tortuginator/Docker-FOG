#!/usr/bin/python'
import os

print "Preparing for IP patch"
print "IP supplied by \'externalIP}' env. : "+str(os.environ['externalIP'])

##PHP chain
with open('/tftpboot/default.ipxe', 'r') as file:
    data = file.readlines()

for i in range(0,len(data)):
    if "chain" in data[i]:
        data[i] = "chain http://" + str(os.environ['externalIP']) + "/fog/service/ipxe/boot.php##params"
        
with open('/tftpboot/default.ipxe', 'w') as file:
    file.writelines( data )

##TFTPD config
with open('/etc/default/tftpd-hpa', 'r') as file:
    data = file.readlines()
    
for i in range(0,len(data)):
    if "TFTP_ADDRESS" in data[i]:
        data[i] = 'TFTP_ADDRESS="[::1]:69"\n'
        
with open('/etc/default/tftpd-hpa', 'w') as file:
    file.writelines( data )

##.fogproject config for UPDATE/REINSTALL
with open('/opt/fog/.fogsettings', 'r') as file:
    data = file.readlines()
    
for i in range(0,len(data)):
    if "ipaddress" in data[i]:
        data[i] = "ipaddress=\'"  + str(os.environ['externalIP']) + "\'\n"
        
with open('/opt/fog/.fogsettings', 'w') as file:
    file.writelines( data )

print("All IP changes applied")