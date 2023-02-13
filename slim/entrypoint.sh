#!/bin/sh

export DOCKER_CMD="$@"
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
