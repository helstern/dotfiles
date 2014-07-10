Links:
===
* [http://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html]()
* [http://mywiki.wooledge.org/DotFiles]()
* [http://askubuntu.com/questions/121073/why-bash-profile-is-not-getting-sourced-when-opening-a-terminal]
* [https://github.com/sstephenson/rbenv/wiki/Unix-shell-initialization]

Config file sourcing order:
===
~/.profile sources ~/.bash_profile (in graphic mode)

~/.bash_profile sources ~/.bashrc

~/.bashrc sources: ~/.bash_alias, ~/.bash_login, ~/.bash_functions

When logging in graphical mode, ~/.profile get sourced  
When opening a terminal, bash is in non-login interactive and ~/.bashrc is sourced  
When logging in via ssh, bash in login interactive mode /etc/profile and ~/.bash_profile is sourced
