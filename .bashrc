#/bin/bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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
# grep use 256 color
export GREP_COLOR='38;5;198'
export GREP_OPTIONS='--color=always'
# colors in ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# paths
export PATH="$PATH:$HOME/scripts" 
export PATH="$PATH:/Applications/MacVim.app/Contents/bin"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/opt/cisco/anyconnect/bin/"

export PYTHONPATH="$HOME/Dropbox/gatech/omscs/CS7646/ml4t:$HOME/repos/git-packages/python-binance:$PYTHONPATH"

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

#oracle
export AIME=/net/aimerepos/results/
alias lsd='ls -l *.dif'

# alias
alias buffet='echo ssh sxi8@buffet04.cc.gatech.edu; ssh sxi8@buffet04.cc.gatech.edu'
alias clear='clear;clear;'
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
alias gitlogn="git log --all  -n 20 --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(#005faf)[%an %cr]%Creset' --abbrev-commit" # --date=format:'%m/%d-%H:%M'"
alias gittree="echo git ls-tree -r master --name-only;git ls-tree -r master --name-only"
alias gitcmt="git commit -a -m"

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# use vi key binding
#set -o vi
#alias ctags='/usr/local/bin/ctags'
alias ctags="brew --prefix/bin/ctags"
alias ctagcrs='cd has; cd src/crsagents; ctags -R --exclude=.ade_path'
alias ctagall='cd has; cd src;  find . -name "*.hxx" -o -name ".cpp" -o -name "*.h" -o -name "*.c" | xargs ctags --c++-kinds=+p --fields=+iaS --extra=+q '
alias ctagpy='ctags -R --exclude=.git --python-kinds=-i --languages=python . '




source /Users/shxi/Library/Preferences/org.dystroy.broot/launcher/bash/br
