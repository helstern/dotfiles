# ~/.profile: executed by the command interpreter for graphical login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

DEBUG=false

# SHELL DETECTION:
# SHELL_TYPE: bash, zsh, SHELL_MODE: interactive, non-interactive, SHELL_STATE: login, non-login

if (type shopt &>/dev/null); then #test existence of shopt
    SHELL_TYPE=bash
    if shopt -q login_shell &>/dev/null; then
        SHELL_STATE=login
    else
        SHELL_STATE=non-login
    fi
elif (type zparseopts &>/dev/null); then #test existence of zparseopts
    SHELL_TYPE=zsh
    if [[ -o login ]]; then
        SHELL_STATE=login
    else
        SHELL_TYPE=nonlogin
    fi
else
    SHELL_TYPE=unknown
    SHELL_STATE=unknown
fi

if test -n "$PS1"; then
    SHELL_MODE=interactive
else
    SHELL_MODE=noninteractive
fi


if [ "$SHELL_TYPE" == "bash" && -f "$HOME/.bash_profile" ] ; then
    . "$HOME/.bash_profile"
fi
