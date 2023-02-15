#!/bin/sh

if [ -z "$MACRO" ]; then
    MACRO=$1
fi

if [ -z "$FOLDER" ]; then
    FOLDER=$2
fi

if [ -z "$DIRECT" ]; then
    DIRECT=1
fi

if [ -z "$CLOSE_BROWSER" ]; then
    CLOSE_BROWSER=1
fi

if [ -z "$CLOSE_KANTU" ]; then
    CLOSE_KANTU=1
fi

if [ -z "$STORAGE" ]; then
    STORAGE="xfile"
fi

if [ -z "$TEST_SUITE" ]; then
    TEST_SUITE=
fi

if [ -n "$MACRO" ] || [ -n "$TEST_SUITE" ] || [ -n "$FOLDER" ]; then
    exec firefox "file:///home/$USER/ui.vision.html?direct=$DIRECT&closeBrowser=$CLOSE_BROWSER&closeKantu=$CLOSE_KANTU&storage=$STORAGE&folder=$FOLDER&testsuite$TEST_SUITE&macro=$MACRO"
else
    echo no macro specified | tee -a /home/$USER/docker.log >&2
fi
