#!/bin/bash



case ${1} in
    apt)
        apt -y install                  \
            software-properties-common  \
            dirmngr                     \
            apt-transport-https         \
            lsb-release                 \
            ca-certificates
            
        add-apt-repository ppa:c.falco/mame
        
        apt install -y mame
    ;;
    download)
        Mame_source=https://github.com/mamedev/mame/releases/download/mame0246/mame0246s.exe
        mame_package=`echo ${mame_source} | awk -F"/" '{print $NF}'`
        mame_folder=mame

        apt install -y                  \
            p7zip                       \
            wget                        \
            qtmultimedia5-dev           \
            qt5-default

        mkdir -p ~/${mame_folder}
        cd ~/${mame_folder}
        wget ${mame_source}

        7zr x ${mame_package}
        make -i
        make install
    ;;
    git)
        mame_git=https://github.com/mamedev/mame.git

        apt install -y          \
            git

        cd ~
        git clone ${mame_git}
        make -i 
        make install
    ;;
    *)
        ${0} apt
    ;;
esac












