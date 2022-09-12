#!/usr/bin/env bash

if test -f $HOME/.eztarget/eztarget.config; then
        source $HOME/.eztarget/eztarget.config
fi

if test -f $INTERFACE_FILE; then
	SELECTED_INTERFACE=$(head -n 1 $INTERFACE_FILE)
	if [[ -n "${SELECTED_INTERFACE// /}" ]]; then
		IP=$(ip -f inet addr show $SELECTED_INTERFACE | sed -En -e 's/. *inet ([0-9.]+).*/\1/p')
		if [[ -n "${IP// /}" ]]; then
			echo "IP: <span color='$IP_COLOR'><tt>$IP</tt></span> ($SELECTED_INTERFACE)"
		else
			echo "IP: Not Found"
		fi
	else
		echo "IP: Interface Not Set"
	fi
else
	echo "IP: Interface Not Set"
fi

echo "---"
LIST_INTERFACES=$(ip -o link show | awk -F': ' '{print $2}')
while IFS= read -r line; do
	echo "$line | bash='echo $line > $FILE' terminal=false refresh=true";
done <<< "$LIST_INTERFACES"
