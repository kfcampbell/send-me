#!/usr/bin/env bash

set -ex

# run the loop a few times to get past race conditions
for i in {0..5}
do
	echo $i
	# send vscode to the first virtual desktop
	wmctrl -r "code" -t 0

	# send terminal to the second virtual desktop
	wmctrl -r "kfcampbell@pop-os" -t 1

	# send one firefox window to third virtual desktop
	wmctrl -l | grep -i firefox | cut -f1 -d' ' | awk 'NR==1' | xargs -I {} wmctrl -ir {} -t 2

	# send the other firefox window to the fourth virtual desktop
	wmctrl -l | grep -i firefox | cut -f1 -d' ' | awk 'NR==2' | xargs -I {} wmctrl -ir {} -t 3

	# send obsidian to the fifth virtual desktop
	# wmctrl -r "@!0,0;BDHF" -t 4
	wmctrl -r "obsidian" -t 4

	# send slack to the sixth virtual desktop
	wmctrl -r "slack" -t 5

	# send spotify,signal,discord to the seventh virtual desktop if they exist
	if wmctrl -l | grep -qi "spotify"; then
		wmctrl -r "spotify" -t 6
	fi

	if wmctrl -l | grep -qi "signal"; then
		wmctrl -r "signal" -t 6
	fi

	if wmctrl -l | grep -qi "discord"; then
		wmctrl -r "discord" -t 6
	fi

done


