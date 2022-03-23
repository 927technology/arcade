#!/bin/bash

case ${PLATFORM} in 
    nes)
        platform_bin=/usr/games/mame
        platform_path=/home/arcade/games/mame/nes
        "${platform_bin}" ${PLATFORM} -cart "${platform_path}/${ROM}"
    ;;
esac