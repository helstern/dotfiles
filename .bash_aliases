# ip related commands
# show all ip aliases
alias ip?='alias | grep -i ^ip'
# show all local ip
alias iplocal='ifconfig | grep --perl-regexp --only-matching "inet addr:(\d+.){3}\d+" | grep --perl-regexp --only-matching "(\d+.){3}\d+"'
# show wan ip
alias ipwan='ipwanexec "ident.me|ifconfig.me|tnx.nl/ip|icanhazip.com|ipecho.net/plain|ip.appspot.com|whatsmyip.akamai.com"'

# copy paste
alias clipboard?='alias | grep -i ^(copy|paste|crypt)'
alias copyclip='xclip -selection clipboard'
alias pasteclip='xclip -selection clipboard -o'
# encrypt contents of clipboards
alias cryptclip="pasteclip | gpg --encrypt --armor --recipient radu.helstern@gmail.com | copyclip"

# ssh
alias ssh?='alias | grep -i ^ssh'
alias sshcopykey="more ~/.ssh/id_rsa.pub | copyclip | echo 'Public key copied to clipboard\n'"

# archive
alias archive?='alias | grep -i ^extract'
alias extract='extractexec'

# find
# list all find aliases
alias find?='alias | grep -i ^find'
# find a piece of text in the current directory
alias findtext='findtextexec'

# time & date
alias datetime?='alias | grep -i ^(date|tstmp)'
# put the date into your clipboard
alias dateclinp='date | copyclip'
# put a timestamp into your clipboard (style is YYYY-MM-DD-HH.MM.SS)
alias tstmpclip='echo -n "$(date +%Y-%m-%d-%H.%M.%S)" | copyclip'
# output a timestamp to the terminal (same format as above)
alias tstmp='date +%Y-%m-%d-%H.%M.%S'
