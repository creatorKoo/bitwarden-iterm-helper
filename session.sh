PATH=/usr/local/bin:$PATH

SERVICE_NAME='creatorkoo.bitwarden-iterm-helper'
SESSION_KEY='session-token'

function loadSession() {
    security find-generic-password -s $SERVICE_NAME -a $SESSION_KEY -w 2>/dev/null
}

function saveSession() {
    SESSION=$1

    security add-generic-password -U -s $SERVICE_NAME -a $SESSION_KEY -w $SESSION
}

function deleteSession() {
    security delete-generic-password -s $SERVICE_NAME -a $SESSION_KEY >/dev/null 2>&1
}

function setSession() {
    SESSION=$1

    export BW_SESSION=$SESSION
}

setSession $(loadSession)