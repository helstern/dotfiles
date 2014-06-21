Links:
===
* [http://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html]()
* [http://mywiki.wooledge.org/DotFiles]()
* [http://askubuntu.com/questions/121073/why-bash-profile-is-not-getting-sourced-when-opening-a-terminal]

Config file sourcing order:
===
~/.bash_profile sources ~/.bashrc

~/.profile sources ~/.bash_profile

~/.bashrc sources: ~/.bash_alias, ~/.bash_login, ~/.bash_functions

When logging in graphical mode, ~/.profile get sourced  
When opening a terminal, bash is in non-login interactive and ~/.bashrc is sourced  
When logging in via ssh, bash in login interactive mode and ~/.bash_profile is sourced  
