# Created by newuser for 5.8
# Lines configured by zsh-newuser-install
#HISTFILE=~/.histfile
#HISTSIZE=1000
#SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

zstyle :compinstall filename '/home/wrabbit/.zshrc'

autoload -Uz compinit
compinit
#promptinit
#prompt adam1

PROMPT='%B%F{#dd9900}[%n]%f%b%F{#668800}%~%f %B%F{#dd9900}%#%f %b'
#RPROMPT='%F{#ffaa00}[%f%F{#668800}%?%f%F{#ffaa00}]%f'

setopt auto_cd
typeset -g -A key

# Keybindings
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
