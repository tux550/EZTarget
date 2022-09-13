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
	# REPORT NMAP
	NMAP_FILE=$SCANS_FOLDER/nmap_$TARGET
	if test -f $NMAP_FILE; then
		echo "NMAP"
		# Clean print from grepablefile
		# Thanks to: https://github.com/leonjza/awesome-nmap-grep
		egrep -v "^#|Status: Up" $NMAP_FILE | cut -d' ' -f2,4- | \
		sed -n -e 's/Ignored.*//p'  | \
		awk '{print "Host: " $1 " Ports: " NF-1; $1=""; for(i=2; i<=NF; i++) { a=a" "$i; }; split(a,s,","); for(e in s) { split(s[e],v,"/"); printf "%-8s %s/%-7s %s\n" , v[2], v[3], v[1], v[5]}; a="" }'
	else
		echo "Report not found"
	fi
else
	echo "Report not found"
fi