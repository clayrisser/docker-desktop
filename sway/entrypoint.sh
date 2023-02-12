#!/bin/sh

cp /xinitrc $HOME/xinitrc
printf "
address=$VNC_ADDRESS
enable_auth=$VNC_ENABLE_AUTH
username=$USER
password=$VNC_PASSWORD
private_key_file=/home/$USER/key.pem
certificate_file=/home/$USER/cert.pem" > /home/$USER/.config/wayvnc/config

if [ "$WLR_BACKENDS" = "headless" ]; then
    exec sway
else
    [ -z "$WAYLAND_DISPLAY" ] && echo "ERROR: WAYLAND_DISPLAY is not set. Need Wayland environment." >&2 && exit 1
    export DISPLAY=":$(echo $WAYLAND_DISPLAY | cut -d- -f2)"
    export XAUTHORITY="$HOME/.Xauthority"
    touch $XAUTHORITY
    xauth add $DISPLAY . $(mcookie)
    exec xinit $HOME/xinitrc -- /usr/bin/Xwayland $DISPLAY -retro -auth $XAUTHORITY -extension MIT-SHM +extension RANDR
fi
