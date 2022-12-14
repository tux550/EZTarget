#!/usr/bin/env bash
max_cols=80

center_box_title() {
	local title edge doubleline cols extra i
	title="${1}"
	cols=$(tput cols)
	if [[ $cols -gt $max_cols ]]; then
  		cols=max_cols
	fi
	edge="│"
	doubleline="═"
	titlelen=${#title}
	padding=$(( (cols-2-titlelen)/2 ))
	extra=$(( (cols-2-titlelen)%2 ))
	# Print title
	printf $edge
	for ((i = 0;i<padding;++i)); do
		printf " "
	done
	printf "%s" "$title"
	for ((i = 0;i<padding;++i)); do
		printf " "
	done
	if [[ extra -eq 1 ]]; then
		printf " "
	fi
	printf "$edge"
	printf "\n"
	# Print underline
	printf $edge
	for ((i = 0;i<padding;++i)); do
		printf " "
	done
	for ((i = 0;i<titlelen;++i)); do
		printf $doubleline
	done
	for ((i = 0;i<padding;++i)); do
		printf " "
	done
	if [[ extra -eq 1 ]]; then
		printf " "
	fi
	printf $edge
	printf "\n"
}

center_box_text() {
	local text edge doubleline cols extra i
	text="${1}"
	cols=$(tput cols)
	if [[ $cols -gt $max_cols ]]; then
  		cols=max_cols
	fi
	edge="│"
	doubleline="═"
	textlen=${#text}
	padding=$(( (cols-2-textlen)/2 ))
	extra=$(( (cols-2-textlen)%2 ))
	# Print text
	printf $edge
	for ((i = 0;i<padding;++i)); do
		printf " "
	done
	printf "%s" "$text"
	for ((i = 0;i<padding;++i)); do
		printf " "
	done
	if [[ extra -eq 1 ]]; then
		printf " "
	fi
	printf "$edge"
	printf "\n"
}

center_box_empty() {
	local edge cols i
	title="${1}"
	cols=$(tput cols)
	if [[ $cols -gt $max_cols ]]; then
  		cols=max_cols
	fi
	edge="│"
	# edges title
	printf $edge
	for ((i = 0;i<cols-2;++i)); do
		printf " "
	done
	printf "$edge"
	printf "\n"
}

center_box_top() {
	local leftcorner rightcorner cols line i
	cols=$(tput cols)
	if [[ $cols -gt $max_cols ]]; then
  		cols=max_cols
	fi
	leftcorner="┌"
	rightcorner="┐"
	line="─"
	# edges title
	printf $leftcorner
	for ((i = 0;i<cols-2;++i)); do
		printf $line
	done
	printf "$rightcorner"
	printf "\n"
}

center_box_bottom() {
	local leftcorner rightcorner cols line i
	cols=$(tput cols)
	if [[ $cols -gt $max_cols ]]; then
  		cols=max_cols
	fi
	leftcorner="└"
	rightcorner="┘"
	line="─"
	# edges title
	printf $leftcorner
	for ((i = 0;i<cols-2;++i)); do
		printf $line
	done
	printf "$rightcorner"
	printf "\n"
}

center_box_divide() {
	local leftcorner rightcorner cols line i
	cols=$(tput cols)
	if [[ $cols -gt $max_cols ]]; then
  		cols=max_cols
	fi
	leftcorner="├"
	rightcorner="┤"
	line="─"
	# edges title
	printf $leftcorner
	for ((i = 0;i<cols-2;++i)); do
		printf $line
	done
	printf "$rightcorner"
	printf "\n"
}


center_box_top
center_box_title "EZTarget"
center_box_text "By: Tux550"
center_box_divide
if [ -z "$EZHOST" ]; then
	center_box_text "Host: Not Set"
else
	center_box_text "Host: $EZHOST"
fi
if [ -z "$EZTARGET" ]; then
	center_box_text "Target: Not Set"
else
	center_box_text "Target: $EZTARGET"
fi
center_box_bottom
