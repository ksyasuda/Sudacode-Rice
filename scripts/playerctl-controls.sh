#!/usr/bin/env bash

set -euo pipefail

check_player() {
	if ! $(playerctl status >/dev/null 2>&1); then
		printf '\n'
		exit 1
	fi
}

check_player

ICON=''
get_icon() {
	check_player
	STATUS=$(playerctl status)
	if [[ $STATUS == "Playing" ]]; then
		ICON=' '
	elif [[ $STATUS == "Paused" ]]; then
		ICON='契 '
	fi
}

while getopts nptsbf options
do
	case $options in
		n)
			playerctl next
			;;
		p)
			playerctl prev
			;;
		t)
			playerctl play-pause
			;;
		s)
			get_icon
			TITLE=$(playerctl metadata title)
			printf "$ICON $TITLE\n" | cut -b  -55
			# printf "$TITLE\n" | zscroll  --before-text "$ICON" --delay 0.3\ 
			# 	--update-check true "playerctl metadata title"
			;;
		b)
			printf "玲\n"
			;;
		f)
			printf "怜\n"
			;;
		?)
			printf "invalid arg\n"
			exit 1
			;;
	esac
done
