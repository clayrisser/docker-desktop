#!/bin/sh

if [ -z "$KEEP_ALIVE" ]; then
    KEEP_ALIVE=0
fi

uivision $DOCKER_CMD &
sleep 5
swaymsg workspace 2
uivision $DOCKER_CMD
( tail -f -n0 /home/$USER/docker.log & ) | grep -q "UI.Vision RPA closing"
echo "uivision completed" >> /home/$USER/docker.log

if [ "$KEEP_ALIVE" != "1" ]; then
    echo "terminating container" >> /home/$USER/docker.log
    sleep 1
    killall sway
fi
