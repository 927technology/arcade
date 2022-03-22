#author: chris murray
#date 20220320
#arcade

FROM ubuntu:21.04
LABEL maintainer="cmurray@927.technology"

ENV version=0.1

#update system
RUN apt update
RUN apt upgrade -y

#install nox
RUN useradd mame
RUN mkdir -p /home/mame
RUN chown -R mame:mame /home/mame
RUN chmod -R 770 /home/mame
RUN apt install -y mame pulseaudio

#set container user
USER mame

#EXPOSE 8080/tcp

#entrypoint
COPY usr/local/bin/entrypoint.sh /usr/local/bin/
#ENTRYPOINT /usr/local/bin/entrypoint.sh
