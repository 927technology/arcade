#!/bin/bash

rom_path=/home/arcade/games
mame_path=/usr/games/mame
vice_path=/usr/local/bin/x64sc
dosbox_path=/usr/bin/dosbox
psx_path=/usr/games/pcsxr
psx2_path=/opt/pcsx2/bin/pcsx2
platform_path=${rom_path}/${PLATFORM}

[ -z ${PLATFORM} ] &&  exit 2
[ -z "${ROM}" ] && exit 2
[ -d "${rom_path}/${PLATFORM}" ] || exit 2

for emulator in ${mame_path} ${vice_path} ${dosbox_path} ${psx_path} ${psx2_path}; do
    [ -f ${emulator} ] && echo ${emulator} found || { echo ${emulator} not found; exit 2; }
done

case ${PLATFORM} in 
    a2600 | a5200 | genesis| nes | snes | tg16)
        platform_bin=${mame_path}
        "${platform_bin}" ${PLATFORM} -cart "${platform_path}/${ROM}"
    ;;
    a7800 | cps | cps2 | cps3 | neo)
        platform_bin=${mame_path}
        "${platform_bin}" -rp ${platform_path} "${ROM}"
    ;;
    c64)
        platform_bin=${vice_path}
        "${platform_bin}" "${platform_path}/${ROM}"
    ;;
    dos)
        platform_bin=${dosbox_path}
        "${platform_bin}" -c "mount c ${platform_path}/${ROM}" -conf "${platform_path}/${ROM}.conf"
    ;;
    psx)
        platform_bin=${psx_path}
        "${platform_bin}" -nogui -cdfile "${platform_path}/${ROM}"
    ;;
    psx2)
        platform_bin=${psx2_path}
        "${platform_bin}" --nogui --fullscreen "${platform_path}/${ROM}"
    ;;
esac