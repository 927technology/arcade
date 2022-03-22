#!/bin/bash

case ${PLATFORM} in 
    nes)
        platform_bin=/usr/games/mame
        platform_path=~/games/mame/nes
        platform_cmd="${platform_bin} ${PLATFORM} -cart ${platform_path}/${ROM}"
    ;;
esac

#run platform_cmd if path and bin are present
[ -d ${platform_path} ] & [ -f ${platform_bin} ] && ${platform_cmd}