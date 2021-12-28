#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ip='ip -color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=always -e'
alias ffmpeg='ffmpeg -hide_banner'
alias java8='/usr/lib/jvm/java-8-openjdk/bin/java'
alias spotify='env LD_PRELOAD=/usr/lib/spotify-adblock.so spotify %U'
export TERM=rxvt-256color
export HISTIGNORE="history:ls:pwd:"
shopt -s histappend

# Created using: http://bashrcgenerator.com/
PS1="\[$(tput bold)\]\u\[$(tput sgr0)\]\[\033[38;5;255m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \w \\$\[$(tput sgr0)\] "

set -o vi

source /home/dasyad00/.bash_shortcuts
source /home/dasyad00/.profile

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
. "$HOME/.cargo/env"
