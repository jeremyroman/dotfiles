host_stuff() {
  hostname=$(hostname -s)
  case $hostname in
    (#i)Jeremy-Romans-MacBook-Pro*)
      echo "mbp"; ;;
    (#i)Jeremy-Romans-iMac*)
      echo "iMac"; ;;
    *)
      echo $hostname; ;;
  esac
}
user_stuff() {
    [[ "$(id -u)" == "0" ]] && echo "%{$fg[red]%}#%{$reset_color%}" || echo "$"
}

git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2>/dev/null) || return
    echo "(${ref#refs/heads/})"
}
hg_prompt_info() {
	ref=$(hg branch 2>/dev/null) || return
	echo "($ref)"
}

setopt prompt_subst
PROMPT='$(host_stuff)[%c] $(user_stuff) '
RPROMPT='%{$fg[green]%}$(git_prompt_info)$(hg_prompt_info)%{$reset_color%}'

