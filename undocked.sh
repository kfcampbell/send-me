#!/usr/bin/env bash

set -ex

# set the active window to the first virtual desktop, switch to the first virtual desktop
# wmctrl -r :ACTIVE: -t 1; wmctrl -s 1

# run the loop a few times to get past race conditions
for i in {0..5}
do
	echo $i
	# send vscode to the first virtual desktop
	wmctrl -r "code" -t 0

	# send terminal to the second virtual desktop
	wmctrl -r "kfcampbell@framework" -t 1

	# send one firefox window to third virtual desktop
	# assuming it has the terraform provider page up
	wmctrl -r "integrations" -t 2

	# send the other firefox window to the fourth virtual desktop
	# assuming it has email up
	wmctrl -r "inbox" -t 3

	# send obsidian to the fifth virtual desktop
	# wmctrl -r "@!0,0;BDHF" -t 4
	wmctrl -r "obsidian" -t 4

	# send slack to the sixth virtual desktop
	wmctrl -r "slack" -t 5
done


