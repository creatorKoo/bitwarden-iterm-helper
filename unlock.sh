#!/bin/sh

source ~/bitwarden-iterm-helper/config.sh

export BW_SESSION="$(bw unlock --raw)"

bw unlock --check 2>/dev/null >/dev/null
[[ $? -ne 0 ]] && exit 1

rm -rf $SESSION_PATH
touch $SESSION_PATH
chmod 600 $SESSION_PATH
echo $BW_SESSION >> $SESSION_PATH
