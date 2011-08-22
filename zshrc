autoload -U colors
colors

#options
setopt AUTO_CD
setopt CORRECT
unsetopt nomatch

autoload -U compinit
compinit

# load other zsh settings
for zscript in ~/.zsh/*.zsh; do
  source $zscript
done
