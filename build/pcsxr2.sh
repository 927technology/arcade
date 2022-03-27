#!/bin/bash

apt remove -y gcc-9 g++-9

apt install -y git cmake g++-10-multilib libaio-dev libasound2-dev libcairo2-dev libegl-dev \
        libegl1-mesa-dev libgdk-pixbuf2.0-dev libgirepository-1.0-1 libgl-dev libgl1-mesa-dev \
        libgl1-mesa-dri libgles-dev libgles-dev libgles2-mesa-dev libglib2.0-dev libglu1-mesa-dev \
        libglu1-mesa libglvnd-dev libglx-dev libglx-mesa0 libglx0 libgtk-3-dev libgtk2.0-dev \
        libharfbuzz-dev liblzma-dev libpango1.0-dev libpcap0.8-dev libpulse-dev \
        libsdl2-dev libsamplerate0-dev libsoundtouch-dev libwxgtk3.0-gtk3-0v5 libwxgtk3.0-gtk3-dev \
        libx11-xcb-dev libxext-dev libxft-dev libxml2-dev portaudio19-dev zlib1g-dev libllvm10

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10
update-alternatives --install /usr/bin/cc  cc  /usr/bin/gcc 30
update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30

cd /opt

git clone https://github.com/PCSX2/pcsx2.git
mkdir pcsx2/build && cd pcsx2/build
git submodule update --init --recursive

cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_REPLAY_LOADERS=TRUE -DCMAKE_BUILD_PO=FALSE -DDISABLE_SETCAP=TRUE ..

make -j$(nproc)
make install

#mkdir -p /opt/pcsx2
mkdir -m770 -p /opt/pcsx2/bin/{bios,cache,cheats,cheats_ws,docs,docs,inis,logs,memcards,resources,shaders,snaps,sstates,textures}
chown arcade:arcade /opt/pcsx2//bin/{bios,cache,cheats,cheats_ws,docs,docs,inis,logs,memcards,resources,shaders,snaps,sstates,textures}
#cp -R /root/pcsx2/bin/* /opt/pcsx2/
cp /root/PCSX2_ui.ini /opt/pcsx2/bin/inis/
cp /root/PCSX2_vm.ini /opt/pcsx2/bin/inis/