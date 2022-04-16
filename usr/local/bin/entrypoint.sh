#!/bin/bash

case ${PLATFORM} in 
    a2600 | a5200 | nes | snes)
        platform_bin=/usr/games/mame
        platform_path=/home/arcade/games/mame/${PLATFORM}
        "${platform_bin}" ${PLATFORM} -cart "${platform_path}/${ROM}"
    ;;
    a7800 | cps | cps2 | cps3 | neo)
        platform_bin=/usr/games/mame
        platform_path=/home/arcade/games/mame/${PLATFORM}
        "${platform_bin}" -rp ${platform_path} "${ROM}"
    ;;
    psx)
        platform_bin=/usr/games/pcsxr
        platform_path=/home/arcade/games/pcsxr
        "${platform_bin}" -nogui -cdfile "${platform_path}/${ROM}"
    ;;
    psx2)
        platform_bin=/opt/pcsx2/bin/pcsx2
        platform_path=/home/arcade/games/pcsx2
        "${platform_bin}" --nogui --fullscreen "${platform_path}/${ROM}"
    ;;
esac