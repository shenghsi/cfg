# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/shxi/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gallois"
ZSH_THEME="amuseme"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
iterm2
zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=/usr/local/mysql/bin:$PATH
export PATH="$PATH:$HOME/scripts" 
export PATH="$PATH:/Applications/MacVim.app/Contents/bin"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/opt/cisco/anyconnect/bin/"

export PYTHONPATH="$HOME/Dropbox/gatech/omscs/CS7646/ml4t:$HOME/repos/git-packages/python-binance:$PYTHONPATH"

export HISTTIMEFORMAT="%F %T "

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias buffet='echo ssh sxi8@buffet04.cc.gatech.edu; ssh sxi8@buffet04.cc.gatech.edu'
alias clear='clear;clear;'
alias ls='ls -GFh'
alias cp='cp -p'
alias es='emacs -nw'
alias ll='ls -ltr'
#alias fg1='fg 1'
#alias fg2='fg 2'
#alias fg3='fg 3'
#alias fg4='fg 4'
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

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# use vi key binding
#set -o vi
#alias ctags='/usr/local/bin/ctags'
alias ctags="brew --prefix/bin/ctags"
alias ctagcrs='cd has; cd src/crsagents; ctags -R --exclude=.ade_path'
alias ctagall='cd has; cd src;  find . -name "*.hxx" -o -name ".cpp" -o -name "*.h" -o -name "*.c" | xargs ctags --c++-kinds=+p --fields=+iaS --extra=+q '
alias ctagpy='ctags -R --exclude=.git --python-kinds=-i --languages=python . '

fg() {
    if [[ $# -eq 1 && $1 = - ]]; then
        builtin fg %-
    else
        builtin fg %"$@"
    fi
}
# from my bash_profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    echo "run conda_setup"
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


