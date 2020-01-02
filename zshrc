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
PURE_GIT_UNTRACKED_DIRTY=0
PURE_CMD_MAX_EXEC_TIME=20
prompt pure

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

# Aliases
alias g=git
alias gl='git clone'
alias gs='git status -s'
alias gf='git fetch'
alias gc='git commit'
