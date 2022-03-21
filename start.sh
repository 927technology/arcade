#!/bin/bash

platform=${1}
game=${2}

docker run -it --rm -v /dev/snd:/dev/snd --privileged --name mame --hostname mame -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix/:/tmp/.X11-unix -v ${HOME}:${HOME} -v /etc/passwd:/etc/passwd -v ~/games/mame:/home/mame/games 927technology/mame:0.1 /usr/games/mame ${platform} -cart "/home/mame/games/${platform}/${game}"
