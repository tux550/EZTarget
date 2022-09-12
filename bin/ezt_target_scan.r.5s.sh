#!/usr/bin/env bash

if test -f $HOME/.eztarget/eztarget.config; then
	source $HOME/.eztarget/eztarget.config
fi

TARGET_STATUS=0 #0=Not set; 1=Found; 2=Out of Reach
if test -f $TARGET_FILE; then
	IP=$(head -n 1 $TARGET_FILE)
	if [[ -n "${IP// /}" ]]; then
		if ping -c 1 -t200 $IP &> /dev/null; then
			echo "Target: <span color='$SUCCESS_COLOR'><tt>$IP</tt></span>"
			TARGET_STATUS=1
		else
			echo "Target: <span color='$FAIL_COLOR'><tt>$IP</tt></span>"
			TARGET_STATUS=2
		fi
	else
		echo "Target: Not set"
	fi
else
	echo "Target: Not Set"
fi

echo "---"

if [[ $TARGET_STATUS -eq 1 ]]; then
	echo "Port Scan | bash='source $INSTALATION_PATH/lib/nmap_target.sh'"
	echo "Subdomain Enumerate (Soon)"
	echo "URL Enumerate (Soon)"
	echo "MORE OPTIONS (Soon ... )"
	echo "--"
fi
echo "Set Target | bash='source $INSTALATION_PATH/lib/set_target.sh $FILE'"
echo "---"
echo "Configure (Soon)"
