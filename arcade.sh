#!/bin/bash

platform="${1}"
rom="${2}"

# docker run                                                              \
#   -it                                                                   \
#   --rm                                                                  \
#   --privileged                                                          \
#   --name arcade                                                         \
#   --hostname arcade                                                     \
#   --device /dev/snd:/dev/snd                                            \
#   -e DISPLAY=${DISPLAY}                                                 \
#   -e PLATFORM=${platform}                                               \
#   -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native                  \
#   -e ROM="${rom}"                                                       \
#   -v /tmp/.X11-unix/:/tmp/.X11-unix                                     \
#   -v ~/arcade/games:/home/arcade/games                                  \
#   -v ${HOME}:${HOME}                                                    \
#   -v ~/games/bios/pcsx2:/opt/pcsx2/bin/bios                             \
#   -v /dev/snd:/dev/snd                                                  \
#   -v /etc/passwd:/etc/passwd                                            \
#   -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket    \
#   -v ~/.config/pulse/cookie:/home/arcade/.config/pulse/cookie           \
#   --entrypoint /bin/bash                                                \
#   -u arcade                                                             \
#   927technology/arcade:0.6






  docker run                                                            \
    -it                                                                 \
    --rm                                                                \
    --name arcade                                                       \
    --hostname arcade                                                   \
    --device /dev/snd:/dev/snd                                          \
    --privileged                                                        \
    -e DISPLAY=${DISPLAY}                                               \
    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native                \
    -e PLATFORM=${platform}                                             \
    -e ROM="${rom}"                                                     \
    -v /dev/snd:/dev/snd                                                \
    -v /tmp/.X11-unix:/tmp/.X11-unix                                    \
    -v ${HOME}:${HOME}                                                  \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket  \
    -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native  \
    -v ~/.config/pulse/cookie:/root/.config/pulse/cookie                \
    -v ~/.config/pulse/cookie:/home/mycroft/.config/pulse/cookie        \
    -v ~/arcade/games:/home/arcade/games                                \
    -v ~/arcade/games/bios/pcsx2:/opt/pcsx2/bin/bios                    \
    -u arcade                                                           \
    927technology/arcade:0.6 