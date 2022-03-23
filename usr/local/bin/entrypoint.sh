#!/bin/bash

case ${PLATFORM} in 
    a2600 | a5200 | a7800 | nes | snes)
        platform_bin=/usr/games/mame
        platform_path=/home/arcade/games/mame/${PLATFORM}
        "${platform_bin}" ${PLATFORM} -cart "${platform_path}/${ROM}"
    ;;
esac