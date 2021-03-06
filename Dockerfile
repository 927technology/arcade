#author: chris murray
#date 20220326
#arcade

FROM ubuntu:20.04
LABEL maintainer="cmurray@927.technology"

ENV version=0.4
ENV DEBIAN_FRONTEND=noninteractive

#update system
RUN apt update
RUN apt upgrade -y

#install nox
RUN useradd arcade
RUN mkdir -p /home/arcade
RUN chown -R arcade:arcade /home/arcade
RUN chmod -R 770 /home/arcade

#add build files
COPY build/ecm_1.03-1_amd64.deb /root/
COPY build/mame.sh /root/
COPY build/pcsxr.sh /root/
COPY build/pcsxr2.sh /root/
COPY build/PCSX2_ui.ini /root/
COPY build/PCSX2_vm.ini /root/

#install
RUN apt install -y pulseaudio
RUN /root/mame.sh
RUN /root/pcsxr.sh
RUN /root/pcsxr2.sh

#set container user
USER arcade

#entrypoint
COPY usr/local/bin/entrypoint.sh /usr/local/bin/
ENTRYPOINT /usr/local/bin/entrypoint.sh
