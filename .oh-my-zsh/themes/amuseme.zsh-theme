# vim:ft=zsh ts=2 sw=2 sts=2
#prompt_status() {
#  local -a user_symbol
#	if [[ $UID -eq 0 ]]; then
#	    user_symbol="%{%F{red}%}#";
#	else
#	    user_symbol="%{$fg_bold[green]%}$";
#	fi
#}

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[magenta]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}."
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg_bold[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

PROMPT=\
'%{$fg_bold[blue]%}%n%{$reset_color%} '\
'%{$fg_bold[red]%}%*%{$reset_color%} '\
'$(git_prompt_info) '\
'%{$fg_bold[green]%}%~%{$reset_color%} '\
'%(?.%{$fg[green]%}.%{$fg[red]%})%(!.#.$)%b '\
'%{$reset_color%}'

# RPROMPT='$(ruby_prompt_info)'

