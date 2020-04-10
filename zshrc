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

# Export Yarn user global path
export PATH="$(yarn global bin):$PATH"

# Zsh git prompt
#GIT_PROMPT_EXECUTABLE="haskell"
#source $HOME/.zsh-git-prompt/zshrc.sh

# Tilix VTE
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte-2.91.sh
fi

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
