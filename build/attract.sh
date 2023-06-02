#!/bin/bash

#variables
##do not use 2.6.2 it is broken
attract_url=https://github.com/mickelson/attract/archive/v2.6.1.tar.gz
attract_file=`echo ${attract_url} | awk -F"/" '{print $NF}'`
attracct_folder=`echo ${attract_file} | sed 's/.tar.gz//g'`

attract_layouts_folder=/usr/local/share/attract/layouts

nevato_url=https://onyxarcade.com/download/nevato-theme.zip
nevato_file=nevato-theme.zip
nevato_folder=nevato

#main
#attract mode
apt install -y          \
  build-essential       \
  gcc                   \
  git                   \
  libarchive-dev        \
  libavcodec-dev        \
  libavfilter-dev       \
  libavformat-dev       \
  libavresample-dev     \
  libavutil-dev         \
  libcurl4-openssl-dev  \
  libfontconfig-dev     \
  libfontconfig1-dev    \
  libfreetype-dev       \
  libglu1-mesa-dev      \
  libjpeg-dev           \
  libopenal-dev         \
  libopengl-dev         \
  libsfml-dev           \
  libswscale-dev        \
  libxinerama-dev       \
  libxrandr-dev         \
  make                  \
  pkg-config            \
  unzip                 \
  wget


cd ~
wget ${attract_url}
tar xzf ${attract_file}
rm -rf ${attract_file}
cd ${attract_folder}
make -j 3
make install
cd ..
rm -rf ${attract_folder}


##Nevato theme
cd ~
wget ${nevato_url}
unzip ${nevato_file}
rm -rf ${nevato_file}
mv ${nevato_folder} ${attract_layouts_folder}
