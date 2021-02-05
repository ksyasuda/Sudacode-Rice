#!/usr/bin/env bash

checkRunning=$(mpc current -f '%title% - %artist%' | cut -c -55)
if [[ $checkRunning == '' ]]; then
	exit 1
fi

checkPlaying=$(mpc status | grep playing)
icon=''
if [[ $checkPlaying == '' ]]; then
	icon=''
else
	icon='契'
fi

echo $icon $checkRunning
# "契"
# ""
# "玲"
# "怜"