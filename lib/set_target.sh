#!/usr/bin/env bash

INSTALATION_PATH=$HOME/.eztarget
FILE=$INSTALATION_PATH/target.txt
read -p "New Target:" TARGET
echo $TARGET > $FILE
exit
