#!/usr/bin/env bash

# Load global configs
if test -f $HOME/.eztarget/eztarget.config; then
	source $HOME/.eztarget/eztarget.config
fi

# Load configs
if test -f $CONFIG_TARGET; then
	source $CONFIG_TARGET
fi

# HEAD
# Show Target Status
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

echo "---"

# BODY
# Reports & Scan
if [[ $TARGET_STATUS -eq 1 ]]; then
	report=0;
	NMAP_FILE=$SCANS_FOLDER/nmap_$TARGET
	if test -f $NMAP_FILE; then
		if [[ $report -eq 0 ]] ; then report=1; echo "Report"; fi
		echo "--Ports | bash='source $LIB_FOLDER/nmap_report.sh'"
	fi
	GOBUSTER_DIR_FILE=$SCANS_FOLDER/gobuster_dir_$TARGET
	if test -f $GOBUSTER_DIR_FILE; then
		if [[ $report -eq 0 ]] ; then report=1; echo "Report"; fi
		echo "--URIs | bash='source $LIB_FOLDER/gobuster_dir_report.sh'"
	fi
	GOBUSTER_VHOST_FILE=$SCANS_FOLDER/gobuster_vhost_$TARGET
	if test -f $GOBUSTER_VHOST_FILE; then
		if [[ $report -eq 0 ]] ; then report=1; echo "Report"; fi
		echo "--Subdomains | bash='source $LIB_FOLDER/gobuster_vhost_report.sh'"
	fi

	echo "Scan"
	echo "--Ports | bash='source $LIB_FOLDER/nmap_target.sh'"
	echo "--URIs | bash='source $LIB_FOLDER/gobuster_dir_target.sh'"
	echo "--Subdomains | bash='source $LIB_FOLDER/gobuster_vhost_target.sh'"
fi

# Config
echo "Edit"
echo "--Target Config | bash='nano $CONFIG_TARGET; exit'"
