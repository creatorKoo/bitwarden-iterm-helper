#!/bin/sh

if [ "$#" -ne 1 ]; then
	echo "$0 <bitwarden item name>"
	exit 1
fi
BW_ITEM_NAME=$1

source ~/bitwarden-iterm-helper/config.sh

ID=$(bw list items --search "$BW_ITEM_NAME" | jq --raw-output ".[] | select( .name == \"$BW_ITEM_NAME\") | .id")

TOTP=$(bw get totp $ID)

echo $TOTP
