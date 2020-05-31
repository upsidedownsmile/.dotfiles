# path to oh-my-zsh
export ZSH="/home/tiago.martins/.oh-my-zsh"

# zsh theme
ZSH_THEME="spaceship"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# zsh plugins
plugins=(git colored-man-pages colorize compleat extract web-search rand-quote)

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# load tmux
case $- in *i*)
  if [ -z "$TMUX" ]; then exec tmux; fi;;
esac

# change layout to us and caps to ctrl
setxkbmap -layout us -option ctrl:nocaps
export EDITOR=nvim

# z jump around
. ~/z/z.sh

# alias to know the size of dirs
alias size='du -sch ./*'

# load scripts
. ~/.scripts/load.sh ~/.scripts/startup/
