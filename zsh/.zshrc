# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
#bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dasyad00/.zshrc'

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
# End of lines added by compinstall

# fix keys
bindkey "^[[H"  beginning-of-line # home
bindkey "^[[7~" beginning-of-line # home
bindkey "^[[F"  end-of-line # end
bindkey "^[[2~" end-of-line # end
bindkey "^[[3~" delete-char # delete
bindkey "^[[1;5C" forward-word # ctrl+right
bindkey "^[[1;5D" backward-word # ctrl+left

# https://wiki.archlinux.org/title/zsh#Key_bindings
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# https://wiki.archlinux.org/title/zsh#History_search

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Aliases
alias ls='ls --color=auto'
alias ip='ip -color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=always'
alias ffmpeg='ffmpeg -hide_banner'
alias java8='/usr/lib/jvm/java-8-openjdk/bin/java'
alias spotify='env LD_PRELOAD=/usr/lib/spotify-adblock.so spotify %U'
export TERM=rxvt-256color
export HISTIGNORE="history:ls:pwd:"

# Created using: https://zsh-prompt-generator.site/
PROMPT="%F{white}%~%f%F{white} $%f "
RPROMPT="%B%n%b%F{white}@%f%F{red}%m%f"

# Sourcing
#. "$HOME/.cargo/env"

# oh-my-zsh
plugins=(
    adb
    sudo
    flutter
    zsh-syntax-highlighting
#zsh-autosuggestions
)

#https://docs.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete#zsh
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet
typeset -U path
