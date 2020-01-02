# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Theme
#ZSH_THEME="two-line"
PROMPT="╭─%F{118}[%F{012}%/% %F{118}]%f
╰─%f➤%f%  "

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"


# Plugins
plugins=(sudo zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# Tilix VTE Config
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte-2.91.sh
fi

# Git Prompt
GIT_PROMPT_EXECUTABLE="haskell"
source $HOME/.zsh-git-prompt/zshrc.sh

# Aliases
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias g=git
alias gl='git clone'
alias gs='git status -s'
alias gf='git fetch'
alias gc='git commit'
