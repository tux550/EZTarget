#!/usr/bin/env bash

if test -f $HOME/.eztarget/eztarget.config; then
	source $HOME/.eztarget/eztarget.config
fi

TARGET=$(head -n 1 $TARGET_FILE)
NMAP_FILE=$SCANS_FOLDER/$TARGET
if test -f $NMAP_FILE; then
	# Ask if update

	# Clean print from grepablefile
	# Thanks to: https://github.com/leonjza/awesome-nmap-grep
	egrep -v "^#|Status: Up" $NMAP_FILE | cut -d' ' -f2,4- | \
	sed -n -e 's/Ignored.*//p'  | \
	awk '{print "Host: " $1 " Ports: " NF-1; $1=""; for(i=2; i<=NF; i++) { a=a" "$i; }; split(a,s,","); for(e in s) { split(s[e],v,"/"); printf "%-8s %s/%-7s %s\n" , v[2], v[3], v[1], v[5]}; a="" }'

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

if $scan; then
	nmap -sV $TARGET -oG $NMAP_FILE
fi

