#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=always -e'
alias ffmpeg='ffmpeg -hide_banner'
export TERM=rxvt-256color

# Created using: http://bashrcgenerator.com/
PS1="\[$(tput bold)\]\u\[$(tput sgr0)\]\[\033[38;5;255m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \w \\$\[$(tput sgr0)\] "

set -o vi

source /home/dasyad00/.bash_shortcuts

#QT_QPA_PLATFORMTHEME='kde'

#export QT_QPA_PLATFORMTHEME=qt5ct
#export QT_QPA_PLATFORMTHEME=kde
#export _JAVA_AWT_WM_NONREPARENTING=1

# cconv() {
#     wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$3" |  sed '/res/!d;s/<[^>]*>//g';
# }


#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# bellecp/fast-p
# sp () {
#     open=zathura
#
#     ag -U -g ".pdf$" \
#     | fast-p \
#     | fzf --read0 --reverse -e -d $'\t'  \
#         --preview-window down:80% --preview '
#             v=$(echo {q} | tr " " "|");
#             echo -e {1}"\n"{2} | grep -E "^|$v" -i --color=always;
#         ' \
#     | cut -z -f 1 -d $'\t' | tr -d '\n' | xargs -r --null $open > /dev/null 2> /dev/null
# }
#source /usr/share/nvm/init-nvm.sh
