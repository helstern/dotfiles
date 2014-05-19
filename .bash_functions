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

# Email me a short note
function briefemailexec(){
    if [ $# -eq 0 ]; then
        echo Usage: briefemailexec
        return 1
    fi
    mailx -s "$@" $USER <<< "$@"
    echo "Sent email"
}

# Extract a file no matter the extension
extractexec () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' can not extract(): can not determine archive type" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
