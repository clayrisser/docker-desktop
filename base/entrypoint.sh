#!/bin/sh

if [ "$container" != "" ]; then # duck type checking for x11docker
    cp /xinitrc $HOME/.xinitrc
    echo "exec \"sway\"" >> $HOME/.xinitrc
    [ -z "$WAYLAND_DISPLAY" ] && echo "ERROR: WAYLAND_DISPLAY is not set. Need Wayland environment." >&2 && exit 1
    export DISPLAY=":$(echo $WAYLAND_DISPLAY | cut -d- -f2)"
    export XAUTHORITY="$HOME/.Xauthority"
    touch $XAUTHORITY
    xauth add $DISPLAY . $(mcookie)
    exec sway
    # exec xinit $HOME/xinitrc -- /usr/bin/Xwayland $DISPLAY -retro -auth $XAUTHORITY -extension MIT-SHM +extension RANDR
else
    export SWAYSOCK="/tmp/sway-ipc.sock"
    export WLR_BACKENDS="headless"
    export WLR_LIBINPUT_NO_DEVICES=1
    export XDG_RUNTIME_DIR="/tmp"
    mkdir -p $HOME/.config/wayvnc
    printf "
address=$VNC_ADDRESS
enable_auth=$VNC_ENABLE_AUTH
username=$USER
password=$VNC_PASSWORD
private_key_file=/home/$USER/key.pem
certificate_file=/home/$USER/cert.pem" > /home/$USER/.config/wayvnc/config
    exec sway
fi
