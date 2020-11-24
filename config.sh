HELPER_PATH=~/bitwarden-iterm-helper
SESSION_PATH=$HELPER_PATH/.bw_session
PATH=/usr/local/bin:$PATH

export BW_SESSION=$(cat $SESSION_PATH 2>/dev/null)
