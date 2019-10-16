#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# Created using: http://bashrcgenerator.com/
PS1="\[$(tput bold)\]\u\[$(tput sgr0)\]\[\033[38;5;255m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \w \\$\[$(tput sgr0)\] "

set -o vi

PATH=$PATH:~/.vim/plugged/vim-live-latex-preview/bin:~/.local/bin

alias ffmpeg='ffmpeg -hide_banner'
export TERM=rxvt-256color

cconv() {
    wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$3" |  sed '/res/!d;s/<[^>]*>//g';
}
source /home/dasyad00/.bash_shortcuts

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
