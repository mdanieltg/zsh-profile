export ZSH=$HOME/.zsh

## Options
# Completion
zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original false
zstyle ':completion:*' select-prompt '%SScrolling: current selection at %p%s'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

autoload -Uz compinit
compinit

# History command configuration
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# Other options
setopt noclobber prompt_subst
setopt autocd beep notify

## Key bindings
bindkey -e

bindkey '^[[F' end-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[[3~' delete-char
bindkey '^[[2~' overwrite-mode
bindkey '^[[1;5C' vi-forward-word
bindkey '^[[1;5D' vi-backward-word
bindkey '^[[3;5~' vi-change-whole-line

## Add relevant directories to the PATH
if ! [[ "$PATH" =~ "$HOME/bin:" ]]; then
	PATH="$HOME/bin:$PATH"
fi
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]; then
	PATH="$HOME/.local/bin:$PATH"
fi

## mkdir and cd into new directory
function mkcd() {
	mkdir -p $@ && cd ${@:$#}
}

## Aliases
alias g=git
alias ga='git add'
alias gap='git add --patch'
alias gau='git add --update'
alias gc='git clone'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias go='git commit'
alias gom='git commit -m'
alias gp='git push'
alias gs='git status -s'
alias ls='ls --color=auto'
alias l='ls -lah'
alias la='ls -lAh'
alias ld='ls -l --group-directories-first'
alias ll='ls -lh'
alias md='mkdir -p'
alias rd=rmdir

## User variables
export EDITOR=$(which vim)
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export LESS=-RF SYSTEMD_PAGER=
export WORDCHARS=_

## Prompt
local prompt_newline=$'\n%{\r%}'

if [[ "$(tty)" = /dev/pts/? ]]
then
	PROMPT="%F{245}%n@%M%f %F{012}%~% %f"
	PROMPT+=${prompt_newline}
	PROMPT+="%F{006}❯%f%  "
else
	PROMPT="%F{white}%n@%M%f %F{blue}%~% %f"
	PROMPT+=${prompt_newline}
	PROMPT+="%F{006}>%f%  "
fi

## zsh-syntax-highlighting
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/sudo.zsh

# vim: ts=4 sw=4 noet
