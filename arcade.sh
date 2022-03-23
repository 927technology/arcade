#!/bin/bash

platform="${1}"
rom="${2}"

docker run                          \
  -it                               \
  --rm                              \
  -v /dev/snd:/dev/snd              \
  --privileged                      \
  --name arcade                     \
  --hostname arcade                 \
  -e DISPLAY=${DISPLAY}             \
  -e PLATFORM=${platform}           \
  -e ROM="${rom}"                   \
  -v /tmp/.X11-unix/:/tmp/.X11-unix \
  -v ${HOME}:${HOME}                \
  -v /etc/passwd:/etc/passwd        \
  -v ~/games:/home/arcade/games     \
  927technology/arcade:0.2