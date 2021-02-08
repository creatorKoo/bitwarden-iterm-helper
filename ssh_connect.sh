#!/bin/sh

if [ "$#" -lt 1 ]; then
	echo "$0 <bitwarden item name> [ssh option argument]"
	exit 1
fi

source ~/bitwarden-iterm-helper/unlock.sh

BW_ITEM_NAME=$1
SSH_OPTION="${@:2}"
ITEM_JSON=$(bw list items --search "$BW_ITEM_NAME" | jq --raw-output ".[] | select( .name == \"$BW_ITEM_NAME\")")

USERNAME=$(echo $ITEM_JSON | jq --raw-output .login.username)
URL=$(echo $ITEM_JSON | jq --raw-output .login.uris[0].uri)

ssh $USERNAME@$URL $SSH_OPTION
