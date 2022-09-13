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
	GOBUSTER_VHOST_FILE=$SCANS_FOLDER/gobuster_vhost_$TARGET
	if test -f $GOBUSTER_VHOST_FILE; then
		# Ask if update
		source "$LIB_FOLDER/gobuster_vhost_report.sh"
		echo "Overwrite?"
		select yn in "yes" "no"; do
			case $yn in
				yes ) echo "Overwriting Confirmed"; scan=true; break;;
				no ) echo "Preserving current files";  scan=false; break;;
			esac
		done
	else
		scan=true;
	fi
else
	echo "Target Not Found"
	scan=false;
fi

if $scan; then
	if ![[ -z "$TARGET_WEBPORT" ]]; then
		TARGET_WEBPORT=80 
	fi
	$GOBUSTER_BIN vhost -u http://$TARGET:$TARGET_WEBPORT -w $GOBUSTER_WORDLIST_VHOST -o $GOBUSTER_VHOST_FILE
fi

