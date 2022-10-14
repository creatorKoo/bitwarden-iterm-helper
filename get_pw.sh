#!/bin/sh

if [ "$#" -ne 1 ]; then
	echo "$0 <bitwarden item name>"
	exit 1
fi
BW_ITEM_NAME=$1

source ~/bitwarden-iterm-helper/session.sh

ID=$(bw list items --search "$BW_ITEM_NAME" | jq --raw-output ".[] | select( .name == \"$BW_ITEM_NAME\") | .id")

PW=$(bw get password $ID)

source ~/bitwarden-iterm-helper/lock.sh

echo $PW
