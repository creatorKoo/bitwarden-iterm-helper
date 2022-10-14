#!/bin/sh

source ~/bitwarden-iterm-helper/config.sh

BW_STATUS=$(bw status 2>/dev/null | jq -r '.status')

if [[ "$BW_STATUS" == 'locked' ]]; then
	export BW_SESSION=$(bw unlock --raw)
	if [ bw unlock --quiet --check --session "$BW_SESSION" >/dev/null 2>&1 ]; then
		echo 'Unlocking Fail'
		sleep 2
		exit -1
	fi

	bw sync

	rm -rf $SESSION_PATH
	touch $SESSION_PATH
	chmod 600 $SESSION_PATH
	echo $BW_SESSION >> $SESSION_PATH
elif [[ $BW_STATUS == 'unauthenticated' ]]; then
	echo 'You are not logged in.'
	sleep 2
	exit -1
fi
