# .bash_profile is executed for login shells, while .bashrc is executed for interactive non-login shells.
# When you login (type username and password) via console, either sitting at the machine, or remotely via ssh,
# .bash_profile is executed to configure your shell before the initial command prompt.
# But, if you’ve already logged into your machine and open a new terminal window (xterm) then .bashrc is executed before the window command prompt.
# .bashrc is also run when you start a new bash instance by typing /bin/bash in a terminal.
# On OS X, Terminal by default runs a login shell every time, so this is a little different to most other systems, but you can configure that in the preferences.

[[ -s ~/.bashrc ]] && source ~/.bashrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source ~/.profile

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=/usr/local/mysql/bin:$PATH

source /Users/shxi/Library/Preferences/org.dystroy.broot/launcher/bash/br
