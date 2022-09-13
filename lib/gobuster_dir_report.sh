#!/usr/bin/env bash

# Load global configs
if test -f $HOME/.eztarget/eztarget.config; then
	source $HOME/.eztarget/eztarget.config
fi

# Load configs
if test -f $CONFIG_TARGET; then
	source $CONFIG_TARGET
fi

# Report
if [[ -n "${TARGET// /}" ]]; then
	# REPORT GOBUSTER
	GOBUSTER_FILE=$SCANS_FOLDER/gobuster_dir_$TARGET
	if test -f $GOBUSTER_FILE; then
		echo "GOBUSTER"
		cat $GOBUSTER_FILE
	else
		echo "Report not found"
	fi
else
	echo "Report not found"
fi
