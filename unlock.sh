#!/bin/sh

source ~/bitwarden-iterm-helper/session.sh

BW_STATUS=$(bw status 2>/dev/null | jq -r '.status')

if [[ "$BW_STATUS" == 'locked' ]]; then
	SESSION=$(bw unlock --raw)
	
	# workaround for https://github.com/bitwarden/cli/issues/480
	bw list folders --nointeraction --session $SESSION >/dev/null 2>&1
	# bw unlock --check --session $SESSION >/dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo 'Unlocking Fail'
		sleep 2
		exit -1
	fi
	# end workaround

	saveSession $SESSION
	setSession $(loadSession)
	
	bw sync
elif [[ $BW_STATUS == 'unauthenticated' ]]; then
	echo 'You are not logged in.'
	sleep 2
	exit -1
fi
