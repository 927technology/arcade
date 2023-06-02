#!/bin/bash
#variables
##bools
exitcrit=1
exitok=0
true=1
false=0

auto_login_path=/etc/systemd/system/getty@tty1.service.d
auto_login_username=${1}

#main
#create autologin user
getent passwd ${auto_login_user}
if [ ! ${?} -eq ${exitok} ]; then
  useradd -m ${auto_login_user}
fi

#x window system
apt install -y            \
  alsa-utils              \
  matchbox-window-manager \
  mate-desktop            \
  xinit   

#allow autologin user access to xserver, audio, video, and tty
echo allowed_uses=anybody > /etc/X11/Xwrapper.config
usermod -aG audio,tty,video ${auto_login_user}

#create xinit script
cat << EOF > /home/${auto_login_user}/.xinitrc
#!/bin/bash
#startx
/usr/bin/matchbox-window-manager & /usr/local/bin/attract
EOF
chmod +x /home/${auto_login_user}/.xinitrc

#start x on automatic shell login
echo /usr/bin/startx >> /home/${auto_login_user}/.bashrc

#automatic login
mkdir -p ${auto_login_path}
cat << EOF >  ${auto_login_path}/autologin.conf
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin ${auto_login_username} --noclear %I $TERM
EOF
