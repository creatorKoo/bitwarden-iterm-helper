#!/bin/sh

source ~/bitwarden-iterm-helper/config.sh

bw lock 2>/dev/null >/dev/null

rm -rf $SESSION_PATH
