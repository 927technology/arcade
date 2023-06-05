#!/bin/bash

rom_path=/home/arcade/games
mame_path=/usr/games/mame
vice_path=/usr/local/bin/x64sc
dosbox_path=/usr/bin/dosbox
psx_path=/usr/games/pcsxr
psx2_path=/opt/pcsx2/bin/pcsx2
platform_path=${rom_path}/${PLATFORM}

[ -z ${PLATFORM} ] &&  { echo ${PLATFORM} not defined; exit 2; }
[ -z "${ROM}" ] && { echo ${ROM} not defined; exit 2; }
[ ! -d "${rom_path}/${PLATFORM}" ] && { echo ${rom_path}/${PLATFORM} not found; exit 2; }

case ${PLATFORM} in 
  a2600 | a5200 | gameboy | gba | gbc | genesis| nes | snes | tg16 )
    platform_bin=${mame_path}
    [ -f ${platform_bin} ] && echo ${platform_bin} found || { echo ${platform_bin} not found; exit 3; }
    "${platform_bin}" ${PLATFORM} -cart "${platform_path}/${ROM}"
  ;;
  a7800 | cps | cps2 | cps3 | neogeo )
    platform_bin=${mame_path}
    [ -f ${platform_bin} ] && echo ${platform_bin} found || { echo ${platform_bin} not found; exit 3; }
    "${platform_bin}" -rp ${platform_path} "${ROM}"
  ;;
  c64 )
    platform_bin=${vice_path}
    [ -f ${platform_bin} ] && echo ${platform_bin} found || { echo ${platform_bin} not found; exit 3; }
    "${platform_bin}" "${platform_path}/${ROM}"
  ;;
  dos )
    platform_bin=${dosbox_path}
    [ -f ${platform_bin} ] && echo ${platform_bin} found || { echo ${platform_bin} not found; exit 3; }
    "${platform_bin}" -c "mount c ${platform_path}/${ROM}" -conf "${platform_path}/${ROM}.conf"
  ;;
  psx )
    platform_bin=${psx_path}
    [ -f ${platform_bin} ] && echo ${platform_bin} found || { echo ${platform_bin} not found; exit 3; }
    "${platform_bin}" -nogui -cdfile "${platform_path}/${ROM}"
  ;;
  psx2 )
    platform_bin=${psx2_path}
    [ -f ${platform_bin} ] && echo ${platform_bin} found || { echo ${platform_bin} not found; exit 3; }
    "${platform_bin}" --nogui --fullscreen "${platform_path}/${ROM}"
  ;;
esac