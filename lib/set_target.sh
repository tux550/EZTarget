#!/usr/bin/env bash

if test -f $HOME/.eztarget/eztarget.config; then
	source $HOME/.eztarget/eztarget.config
fi

read -p "New Target:" TARGET
echo $TARGET > $TARGET_FILE
exit
