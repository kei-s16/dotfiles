# Created by newuser for 5.0.2

#-----

export EDITOR=vim
bindkey -v
export LANG=ja_JP.UTF-8
export KCODE=u
export CLICOLOR=true

#-----

autoload -Uz colors
colors

autoload -Uz compinit
compinit

setopt auto_list
setopt auto_menu
setopt auto_cd
setopt list_packed
setopt list_types

#-----

setopt print_eight_bit
setopt no_flow_control
setopt ignore_eof
setopt correct

#-----

HISTFILE=~/.zsh/histfile
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist
setopt extended_history
setopt share_history
setopt hist_reduce_blanks
setopt histignorealldups

#-----

autoload -Uz add-zsh-hook
autoload -Uz terminfo
autoload -Uz vcs_info

terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
left_down_prompt_preexec(){
	print -rn -- $terminfo[el]
}

zstyle ':vcs_info:*' formats '%F{green}[%b]%f'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd(){vcs_info}
setopt prompt_subst

function zle-keymap-select zle-line-init zle-line-finish
{
    case $KEYMAP in
        main|viins)
            PROMPT_2="$fg[cyan]-- INSERT --$reset_color"
            ;;
        vicmd)
            PROMPT_2="$fg[white]-- NORMAL --$reset_color"
            ;;
        vivis|vivli)
            PROMPT_2="$fg[yellow]-- VISUAL --$reset_color"
            ;;
    esac

    PROMPT='%{$terminfo_down_sc$PROMPT_2$terminfo[rc]%}%(?.%{${fg[green]}%}.%{${fg[red]}%})%n%{${reset_color}%}@${fg[blue]}%m${reset_color}(%*%) %# '
    RPROMPT='%~${vcs_info_msg_0_}'
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
zle -N edit-command-line

#-----

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#-----
alias v=nvim
alias vi=nvim
alias vim=nvim

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

case ${OSTYPE} in
	darwin*)
		alias ls="ls -G"
		alias la="ls -aG"
		alias ll="ls -lG"
		alias lal="ls -laG"
		;;
	linux*)
		alias ls='ls --color'
		alias la='ls -a --color'
		alias ll='ls -l --color'
		alias lal='ls -la --color'
		;;
esac

#-----

function cd(){
	builtin cd $@ && ls;
}

