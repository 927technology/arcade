#!/bin/bash

platform="${1}"
rom="${2}"
arcade_root=~/arcade
arcade_version=0.8

  docker run                                                            		\
    -it                                                                 		\
    --rm                                                                		\
    --name arcade                                                       		\
    --hostname arcade                                                   		\
    --device /dev/snd:/dev/snd                                          		\
    --device /dev:/dev									                                    \
    --privileged                                                        		\
    -e DISPLAY=${DISPLAY}                                               		\
    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native                		\
    -e PLATFORM=${platform}                                             		\
    -e ROM="${rom}"                                                     		\
    -v /dev/snd:/dev/snd                                                		\
    -v /tmp/.X11-unix:/tmp/.X11-unix                                    		\
    -v ${HOME}:${HOME}                                                  		\
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket  		\
    -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native  		\
    -v ~/.config/pulse/cookie:/root/.config/pulse/cookie                		\
    -v ~/.config/pulse/cookie:/home/mycroft/.config/pulse/cookie        		\
    -v ${arcade_root}/games:/home/arcade/games                           		\
    -v ${arcade_root}/games/bios:/home/arcade/mame/roms                  		\
    -v ${arcade_root}/games/bios/pcsx2:/opt/pcsx2/bin/bios               		\
    -v ${arcade_root}/nvram:/home/arcade/.mame/nvram                     		\
    -v ${arcade_root}/dosbox/dosbox-0.74-3.conf:/home/arcade/.dosbox/dosbox-0.74-3.conf	\
    -u arcade                                                         	    \
    927technology/arcade:${arcade_version}

    #--entrypoint /bin/bash								\
