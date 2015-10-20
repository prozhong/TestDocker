#!/bin/bash

if [ ! -f /data/minecraft_server.1.8.8.jar ]; then
	cp -f minecraft_server.1.8.8.jar /data/minecraft_server.1.8.8.jar
fi

if [ ! -f /data/server.properties ]; then
	wget -q --no-check-certificate https://raw.githubusercontent.com/prozhong/TestDocker/master/server.properties -O /data/server.properties
fi

if [ ! -f /data/eula.txt ]; then
	wget -q --no-check-certificate https://raw.githubusercontent.com/prozhong/TestDocker/master/eula.txt -O /data/eula.txt
fi

screen -S "MC"

java -Xmx32M -jar minecraft_server.1.8.8.jar nogui