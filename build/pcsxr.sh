#!/bin/bash

#install pcsxr
apt install -y pcsxr wget

#install ecm
dpkg -i /root/ecm_1.03-1_amd64.deb

#convert .ecm file to .bin
##ecm-uncompress <file>.img.ecm <file>.img