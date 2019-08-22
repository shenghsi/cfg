#/bin/bash

# Colors!
red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
yellow="\[\033[1;33m\]"
blue="\[\033[1;34m\]"
magenta="\[\033[0;35m\]"
cyan="\[\033[1;36m\]"
white="\[\033[0;37m\]"
end="\[\033[0m\]" # This is needed at the end, otherwise, the colors of terminal input and output are affected

#export PS1="${green}\u${white}@${green}\h ${magenta}\t ${yellow}\w${cyan}\$ "
export PS1="${green}\u${white}@${magenta}\t ${yellow}\w ${cyan}\$ ${end}"

#export PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
#export PS1="\[\033[35;1m\]\w\[\033[m\]\[\033[34;1m\]\$\[\033[m\] "
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

alias ls='ls -GFh'
alias cp='cp -p'
alias es='emacs -nw'
alias ll='ls -ltr'
alias fg1='fg 1'
alias fg2='fg 2'
alias fg3='fg 3'
alias fg4='fg 4'
alias textedit='open -a TextEdit'

#alias gittree='git log --all --graph --decorate --oneline --simplify-by-decoration'
#alias gittree='git log --all --graph --decorate --oneline'
#alias gitlog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen %ci %C(bold blue) <%an> %Creset' --abbrev-commit"
alias gitlog="git log --all --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(#005faf)[%an %cr]%Creset' --abbrev-commit" # --date=format:'%m/%d-%H:%M'"
alias gitlogl="git log -n 20 --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(#005faf)[%an %cr]%Creset' --abbrev-commit" # --date=format:'%m/%d-%H:%M'"

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

export PATH="$PATH:$HOME/scripts" 
export PATH="$PATH:/Applications/MacVim.app/Contents/bin"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#export GREP_COLOR='1;31;40'
# use 256 color
export GREP_COLOR='38;5;198'
export GREP_OPTIONS='--color=always'

#export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
#alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
#alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'
#export ANTJAR="/Users/shxi/omscs/CS8803compiler/Summer_Compilers_Project_1/antlr/antlr-4.7.2-complete.jar"
#export CLASSPATH=".:$ANTJAR:$CLASSPATH"
#alias antlr4='java -Xmx500M -cp $CLASSPATH org.antlr.v4.Tool'
#alias antj='java -jar $ANTJAR'
#alias antjc='javac -cp $ANTJAR' 
#alias grun='java -Xmx500M -cp $CLASSPATH org.antlr.v4.gui.TestRig'

#export LC_ALL=en_US.utf-8
#export LANG="$LC_ALL"

#export HISTTIMEFORMAT="%d/%m/%yyyy %T "
export HISTTIMEFORMAT="%F %T "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias config='/usr/bin/git --git-dir=/Users/shxi/.cfg/ --work-tree=/Users/shxi'
set -o vi
alias ctags='/usr/local/bin/ctags'
