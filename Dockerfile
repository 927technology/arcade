#author: chris murray
#date 20220320
#arcade

FROM ubuntu:21.04
LABEL maintainer="cmurray@927.technology"

ENV version=0.2

#update system
RUN apt update
RUN apt upgrade -y

#install nox
RUN useradd arcade
RUN mkdir -p /home/arcade
RUN chown -R arcade:arcade /home/arcade
RUN chmod -R 770 /home/arcade
RUN apt install -y mame pulseaudio

#set container user
USER arcade

#entrypoint
COPY usr/local/bin/entrypoint.sh /usr/local/bin/
ENTRYPOINT /usr/local/bin/entrypoint.sh
