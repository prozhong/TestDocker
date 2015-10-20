#!/bin/bash

if [ ! -f /data/minecraft_server.1.8.8.jar ]; then
	cp -f minecraft_server.1.8.8.jar /data/minecraft_server.1.8.8.jar
fi

screen -S "MC"

java -Xmx32M -Xms512M -jar minecraft_server.1.8.8.jar nogui