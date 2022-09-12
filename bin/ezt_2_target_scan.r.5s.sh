#!/usr/bin/env bash

if test -f $HOME/.eztarget/eztarget.config; then
	source $HOME/.eztarget/eztarget.config
fi

TARGET_STATUS=0 #0=Not set; 1=Found; 2=Out of Reach
if test -f $TARGET_FILE; then
	TARGET=$(head -n 1 $TARGET_FILE)
	if [[ -n "${TARGET// /}" ]]; then
		if ping -c 1 -t200 $TARGET &> /dev/null; then
			echo "Target: <span color='$SUCCESS_COLOR'><tt>$TARGET</tt></span>"
			TARGET_STATUS=1
		else
			echo "Target: <span color='$FAIL_COLOR'><tt>$TARGET</tt></span>"
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
	
	report=0;
	NMAP_FILE=$SCANS_FOLDER/$TARGET
	if test -f $NMAP_FILE; then
		if report==0; then report=1; echo "Report"; fi
		echo "--Ports | bash='source $LIB_FOLDER/nmap_report.sh'"
	fi

	echo "Scan"
	echo "--Ports | bash='source $LIB_FOLDER/nmap_target.sh'"
	echo "--(Subdomains...)"
	echo "--(URL...)"
	echo "--(Soon...)"
fi
echo "Target"
echo "--Set | bash='source $LIB_FOLDER/set_target.sh $FILE'"
#echo "Configure (Soon)"
