FROM fogbase
MAINTAINER Felix Friedberger <felix.friedberger@rwth-aachen.de>

ADD startInstance.sh /tmp
ADD firstSetup.sh /tmp
COPY \fogproject /tmp
ADD respond.txt /tmp
ADD functions.sh /tmp
ADD updateIP.sh /tmp
COPY etc/init.d/vsftpd /etc/init.d/

RUN cd /tmp/fogproject/bin \
 && cat /tmp/respond.txt | bash ./installfog.sh -X 

##SETUP AUTOSTART and CONFIG
RUN cd \
 && bash /tmp/firstSetup.sh 
 
EXPOSE 21/tcp 80/tcp 111/tcp 2049/tcp 4045/tcp 8099/tcp 9098/tcp 34463/tcp 69/udp 111/udp 212/udp 2049/udp 4045/udp 34463/udp

##AUTOSTART
CMD ["/tmp/startInstance.sh"]