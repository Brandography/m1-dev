#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "Enter your project name"
else
    DEVDIR=$(dirname "$0")
    echo "Initializing Project $1!"

    cp $DEVDIR/.env.sample .env
    sed -i "s/PROJECT_NAME=.*/PROJECT_NAME=$1/" .env

    if [ ! -d "src" ]; then
        echo "Creating src dir."
        mkdir src
    fi

    cp $DEVDIR/Makefile.sample ./Makefile
    sed -i '1iDEV_DIR='$DEVDIR Makefile
    sed -i '1iPROJECT_NAME='$1 Makefile
fi