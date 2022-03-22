#!/bin/bash

platform=${1}
platform_path=~/games
rom=${2}



[ -z ${platform} ] & [ -z ${rom} ] & [ -d ${platform_path} } ||     \
  docker run                                                        \
    -it                                                             \
    --rm                                                            \
    --privileged                                                    \
    --name mame                                                     \
    --hostname arcade                                               \
    -e DISPLAY=${DISPLAY}                                           \
    -e PLATFORM=${platform}                                         \
    -e ROM=${rom}                                                   \
    -v /tmp/.X11-unix/:/tmp/.X11-unix                               \
    -v /dev/snd:/dev/snd                                            \
    -v ${HOME}:${HOME}                                              \
    -v /etc/passwd:/etc/passwd                                      \
    927technology/mame:0.2