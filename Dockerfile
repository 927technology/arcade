#author: chris murray
#date 20220805
#arcade

#FROM ubuntu:20.04
FROM debian:11
LABEL maintainer="cmurray@927.technology"

ENV VERSION=0.8
ENV DEBIAN_FRONTEND=noninteractive

#update system
RUN apt update
RUN apt upgrade -y

#configure environment
RUN useradd arcade
RUN mkdir -p /home/arcade
RUN chown -R arcade:arcade /home/arcade
RUN chmod -R 770 /home/arcade

#add build files
COPY build/dosbox.sh /root/
COPY build/ecm_1.03-1_amd64.deb /root/
COPY build/mame.sh /root/
COPY build/pcsxr.sh /root/
COPY build/pcsxr2.sh /root/
COPY build/PCSX2_ui.ini /root/
COPY build/PCSX2_vm.ini /root/
COPY build/vice.sh /root/

#install
RUN apt update
RUN apt install -y pulseaudio mate-desktop
RUN /root/dosbox.sh
RUN /root/mame.sh apt
RUN /root/pcsxr.sh
RUN /root/pcsxr2.sh
RUN /root/vice.sh

#set container user
USER arcade

#entrypoint
COPY usr/local/bin/entrypoint.sh /usr/local/bin/
ENTRYPOINT /usr/local/bin/entrypoint.sh
