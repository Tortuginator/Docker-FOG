FROM fogbase
MAINTAINER Felix Friedberger <felix.friedberger@rwth-aachen.de>

ADD startInstance.sh /tmp
ADD firstSetup.sh /tmp
ADD fixChain.py /tmp
COPY \fog_1.5.0 /tmp

##INSTALL FOG USING STANDARD SCRIPT
##RUN wget -P /tmp https://github.com/FOGProject/fogproject/releases/download/1.5.0/fog_1.5.0.tar.gz
##RUN tar -C /tmp/ -xzvf /tmp/fog_1.5.0.tar.gz
RUN cd /tmp/fog_1.5.0/bin \
 && bash ./installfog.sh -y 

##SETUP AUTOSTART and CONFIG
RUN cd \
 && bash /tmp/firstSetup.sh 
 
EXPOSE 21/tcp 80/tcp 111/tcp 2049/tcp 4045/tcp 8099/tcp 9098/tcp 34463/tcp 69/udp 111/udp 212/udp 2049/udp 4045/udp 34463/udp

##AUTOSTART
CMD ["/tmp/startInstance.sh"]