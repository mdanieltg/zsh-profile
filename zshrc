# Oh my Zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(sudo zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Pure prompt
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
zstyle :prompt:pure:prompt:success color cyan
zstyle :prompt:pure:prompt:error color magenta
PURE_GIT_UNTRACKED_DIRTY=0
PURE_CMD_MAX_EXEC_TIME=20
prompt pure

# Add relevant directories to the PATH
YARN_GPATH="$(yarn global bin)"
if ! [[ "$PATH" =~ "$YARN_GPATH:" ]]; then
	PATH="$YARN_GPATH:$PATH"
fi
if ! [[ "$PATH" =~ "$HOME/bin:" ]]; then
	PATH="$HOME/bin:$PATH"
fi
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# Zsh git prompt
#GIT_PROMPT_EXECUTABLE="haskell"
#source $HOME/.zsh-git-prompt/zshrc.sh

# User configuration
DOTNET_CLI_TELEMETRY_OPTOUT=1
bindkey -v
set -o noclobber

# Aliases
alias g=git
alias gc='git clone'
alias go='git commit'
alias gd='git diff'
alias gf='git fetch'
alias gp='git push'
alias gs='git status -s'

# mkdir and cd into new directory
function mkd {
	if [ "$#" -eq 1 ]; then
		mkdir $1 && cd $1
	elif [ "$#" -gt 1 ]; then
		echo 'Se esperaba un sólo argumento'
	else
		echo 'mkdir: falta un operando'
	fi
}
