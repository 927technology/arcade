#!/bin/bash

vice_source=https://sourceforge.net/projects/vice-emu/files/releases/vice-3.6.1.tar.gz
vice_package=`echo ${vice_source} | awk -F"/" '{print $NF}'`
vice_folder=`echo ${vice_package} | sed 's/.tar.gz//'`

apt update
apt upgrade -y

apt install -y                  \
    flex                        \
    byacc                       \
    dos2unix                    \
    xa65                        \
    advi                        \
    texinfo                     \
    texlive-latex-base          \
    texlive-fonts-recommended   \
    texlive-latex-extra         \
    libglib2.0-dev              \
    libsdl2-image-dev           \
    libpng-dev                  \
    wget                        \
    g++                         \
    libsdl-ocaml-dev            \
    libglew-dev

wget ${vice_source}
tar xzf ${vice_package}
cd ${vice_folder}
./configure
make
make install

