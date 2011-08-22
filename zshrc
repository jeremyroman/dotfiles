# because I don't like zsh's percent signs
user_stuff() {
    [[ "$(id -u)" == "0" ]] && echo "%{$fg[red]%}%n#%{$reset_color%}" || echo "%n$"
}

git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2>/dev/null) || return
    echo "(${ref#refs/heads/})"
}
hg_prompt_info() {
	ref=$(hg branch 2>/dev/null) || return
	echo "($ref)"
}
autoload -U colors
colors
setopt prompt_subst
unsetopt nomatch
PROMPT='%m:%c $(user_stuff) '
RPROMPT='%{$fg[green]%}$(git_prompt_info)$(hg_prompt_info)%{$reset_color%}'

#options
setopt AUTO_CD
setopt CORRECT

autoload -U compinit
compinit

# load other zsh settings
for zscript in ~/.zsh/*.zsh; do
  source $zscript
done
