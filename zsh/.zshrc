# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dasyad00/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Aliases
alias ls='ls --color=auto'
alias ip='ip -color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=always -e'
alias ffmpeg='ffmpeg -hide_banner'
alias java8='/usr/lib/jvm/java-8-openjdk/bin/java'
alias spotify='env LD_PRELOAD=/usr/lib/spotify-adblock.so spotify %U'
export TERM=rxvt-256color
export HISTIGNORE="history:ls:pwd:"

# Created using: https://zsh-prompt-generator.site/
PROMPT="%F{white}%~%f%F{white} $%f "
RPROMPT="%B%n%b%F{white}@%f%F{red}%m%f"

# Sourcing
. "$HOME/.cargo/env"
