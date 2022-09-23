#!/usr/bin/env bash

set -ex

# set the active window to the first virtual desktop, switch to the first virtual desktop
# wmctrl -r :ACTIVE: -t 1; wmctrl -s 1

# send vscode to the first virtual desktop
wmctrl -r "code" -t 0

# send terminal to the first virtual desktop
wmctrl -r kfcampbell@framework -t 0

# send one firefox window to the second virtual desktop
# assuming it has the terraform provider page up
wmctrl -r "integrations" -t 1

# send the other firefox window to the second virtual desktop
# assuming it has email up
wmctrl -r "inbox" -t 1

# send obsidian to the third virtual desktop
# wmctrl -r "@!0,0;BDHF" -t 2
wmctrl -r "obsidian" -t 2

# send slack to the third virtual desktop
wmctrl -r "slack" -t 2

# send spotify,signal,discord to the fourth virtual desktop if they exist
	if wmctrl -l | grep -qi "spotify"; then
		wmctrl -r "spotify" -t 4
	fi

	if wmctrl -l | grep -qi "signal"; then
		wmctrl -r "signal" -t 4
	fi

	if wmctrl -l | grep -qi "discord"; then
		wmctrl -r "discord" -t 4
	fi
