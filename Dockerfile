# Minecraft 1.8.8 Dockerfile
# Server Version PaperSpigot

FROM ubuntu:14.04

MAINTAINER prozhong <prozhong@msn.cn>

ADD sources.list /etc/apt/sources.list

# Install packages

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server pwgen
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install openjdk-7-jre-headless wget
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install screen
RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
ADD start_server.sh /start_server.sh
RUN chmod +x /*.sh

# Download Minecraft Server components

RUN wget -q https://s3.amazonaws.com/Minecraft.Download/versions/1.8.8/minecraft_server.1.8.8.jar

ENV AUTHORIZED_KEYS **None**

VOLUME ["/data"]

EXPOSE 22
EXPOSE 25565
CMD ["/run.sh"]