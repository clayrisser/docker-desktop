#!/bin/sh

if [ -z "$MACRO" ]; then
    MACRO=$1
fi

if [ -z "$DIRECT" ]; then
    DIRECT=1
fi

if [ -z "$CLOSE_BROWSER" ]; then
    CLOSE_BROWSER=1
fi

if [ -z "$CLOSE_RPA" ]; then
    CLOSE_RPA=1
fi

if [ -z "$STORAGE" ]; then
    STORAGE="xfile"
fi

if [ -z "$LOAD_MACRO_TREE" ]; then
    LOAD_MACRO_TREE=0
fi

if [ -n "$MACRO" ] || [ -n "$TEST_SUITE" ] || [ -n "$FOLDER" ]; then
    exec firefox --new-window "file:///home/$USER/ui.vision.html?$([ "$DIRECT" = "1" ] && echo "direct=1&" || true)loadmacrotree=$LOAD_MACRO_TREE&closeBrowser=$CLOSE_BROWSER&closeRPA=$CLOSE_RPA&storage=$STORAGE&folder=$FOLDER&macro=$MACRO&cmd_var1=$CMD_VAR1&cmd_var2=$CMD_VAR2&cmd_var3=$CMD_VAR3"
else
    echo no macro specified | tee -a /home/$USER/docker.log >&2
fi
