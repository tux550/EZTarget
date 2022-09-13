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
	GOBUSTER_DIR_FILE=$SCANS_FOLDER/gobuster_dir_$TARGET
	if test -f $GOBUSTER_DIR_FILE; then
		echo "URIs (gobuster)"
		cat $GOBUSTER_DIR_FILE
	else
		echo "Report not found"
	fi
else
	echo "Report not found"
fi
