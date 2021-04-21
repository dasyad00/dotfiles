#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=always -e'
alias spotify='LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify'
export TERM=rxvt-256color

# Created using: http://bashrcgenerator.com/
PS1="\[$(tput bold)\]\u\[$(tput sgr0)\]\[\033[38;5;255m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \w \\$\[$(tput sgr0)\] "

set -o vi

PATH=$PATH:~/.vim/plugged/vim-live-latex-preview/bin:~/.local/bin
# USE PATH below to use normal Python
PATH=/usr/bin/python:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/dasyad00/.vim/plugged/vim-live-latex-preview/bin:/home/dasyad00/.local/bin
# Use PATH below to use anaconda
#PATH=/usr/local/anaconda/bin:/usr/condabin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/dasyad00/.vim/plugged/vim-live-latex-preview/bin:/home/dasyad00/.local/bin
QT_QPA_PLATFORMTHEME='kde'

alias ffmpeg='ffmpeg -hide_banner'
#export QT_QPA_PLATFORMTHEME=qt5ct
#export QT_QPA_PLATFORMTHEME=kde
export _JAVA_AWT_WM_NONREPARENTING=1

cconv() {
    wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$3" |  sed '/res/!d;s/<[^>]*>//g';
}
source /home/dasyad00/.bash_shortcuts

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
#        . "/usr/etc/profile.d/conda.sh"
#    else
#        export PATH="/usr/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
#

# bellecp/fast-p
sp () {
    open=zathura

    ag -U -g ".pdf$" \
    | fast-p \
    | fzf --read0 --reverse -e -d $'\t'  \
        --preview-window down:80% --preview '
            v=$(echo {q} | tr " " "|");
            echo -e {1}"\n"{2} | grep -E "^|$v" -i --color=always;
        ' \
    | cut -z -f 1 -d $'\t' | tr -d '\n' | xargs -r --null $open > /dev/null 2> /dev/null
}
source /usr/share/nvm/init-nvm.sh
