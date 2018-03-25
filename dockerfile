FROM debian:latest
MAINTAINER Felix Friedberger <felix.friedberger@rwth-aachen.de>

ADD startInstance.sh /tmp
ADD firstSetup.sh /tmp
COPY ./fog_1.5.0 /tmp/fog_1.5.0

RUN apt-get update \
 && apt-get -y dist-upgrade \
 && apt-get update 
RUN apt-get install -y php apache2 libapache2-mod-php mysql-server git 
RUN apt-get install -y wget net-tools nano
RUN apt-get clean 
RUN a2enmod rewrite \
 && cd /tmp \
 && bash ./firstSetup.sh
 && cd fog_1.5.0/bin \
 && bash ./installfog.sh -y
 
 
EXPOSE 21/tcp 80/tcp 111/tcp 2049/tcp 4045/tcp 8099/tcp 9098/tcp 34463/tcp 69/udp 111/udp 212/udp 2049/udp 4045/udp 34463/udp

CMD ["/tmp/startInstances.sh"]