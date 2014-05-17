# expects a pipe separated list of urls to services (icanhazip.com for instance)that display only the client's ip
# it tries every url in the list until one returns an ip
function ipwanexec() {
    local list=$(echo "$1" | tr "|" "$IFS");
    local url;
    for url in $list; do
        wget --tries=1 --timeout=1 -q -O - "$url" | grep -P -o "^(\d+.){3}(\d+)$" && break;
    done;
    if [ "$?" -eq "0" ]; then
        return 0
    else
        return 1
    fi
}
