# .bash_profile is executed for login shells, while .bashrc is executed for interactive non-login shells.
# When you login (type username and password) via console, either sitting at the machine, or remotely via ssh,
# .bash_profile is executed to configure your shell before the initial command prompt.
# But, if you’ve already logged into your machine and open a new terminal window (xterm) then .bashrc is executed before the window command prompt.
# .bashrc is also run when you start a new bash instance by typing /bin/bash in a terminal.
# On OS X, Terminal by default runs a login shell every time, so this is a little different to most other systems, but you can configure that in the preferences.

export PATH="/usr/local/bin:$PATH"
[[ -s ~/.bashrc ]] && source ~/.bashrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source ~/.profile

# added by Anaconda3 5.0.1 installer
export PATH="/Applications/Anaconda/anaconda3/bin:$PATH"
export PYTHONPATH="/Users/shenghsi/repos/git-packages/python-binance:$PYTHONPATH"
# grep with color
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;38'
#'1;31;40'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
