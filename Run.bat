docker run -p 212:212/udp -p 9098:9098 -p 21:21 -p 80:80 -p 69:69/udp -p 8099:8099 -p 2049:2049 -p 2049:2049/udp -p 111:111/udp -p 4045:4045/udp -p 4045:4045 -p 111:111 -p 34463:34463/udp -p 34463:34463 --privileged -h fogProjectServer -e EXTIP=192.168.1.130 fogv005
