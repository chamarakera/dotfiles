# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubectx)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=$PATH:/opt/homebrew/bin
eval $(brew shellenv)

export PATH=$HOME/.asdf/shims:$PATH

# aws
alias asl='aws sso login'

# kubernetes
alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"
alias kg="kubectl get"
alias kxu="kubectl config unset current-contextg"
alias kexec="kubectl exec --stdin --tty $1 -- /bin/bash"
alias kurl="kubectl run curl --rm -it --image=appropriate/curl --restart=Never --command /bin/sh"
alias debug="kubectl run -i --tty --rm debug --image=ubuntu:latest --restart=Never -- /bin/bash"
alias debugalpine="kubectl run -i --tty --rm debug --image=alpine:3.7 --restart=Never -- /bin/sh"
alias kad='kubectl --context ap-southeast-2-dev'
alias kap='kubectl --context ap-southeast-2'
alias kcontext='kubectl config current-context'
alias kcontexts='kubectl config get-contexts'
alias kdo='kubectl --context us-east-1-devops'
alias kdt='kubectl --context ap-southeast-2-devops-test'
alias ked='kubectl --context eu-west-1-dev'
alias kep='kubectl --context eu-west-1'
alias kjd='kubectl --context propeller-jobs-ap-southeast-2-dev'
alias kud='kubectl --context us-east-1-dev'
alias kup='kubectl --context us-east-1'

# terraform
alias tf="terraform"
alias tfp='terraform plan'
alias tfi='terraform init'
alias tfm='terraform fmt -recursive'
alias tfa='terraform apply'
alias tfu='terraform force-unlock -force'
alias tfpt="terraform show -no-color -json plan | jq -r '.resource_changes[] | select(.change.actions[0]=="update" or .change.actions[0]=="create" or .change.actions[0]=="create") | .address'"

# python
alias pip="pip3"
alias p="python"

# poetry
alias prun='poetry run python $1'
alias padd='poetry add $1'

# git
alias ga='git add -A'
alias gp='git push'
alias gpst='git push --set-upstream origin $1'
alias gl='git log'

# function based aliases
function gacp {
    git add . && git commit -m "$*" && git push
}

function gc {
    git commit -m "$*"
}

function gco {
    git checkout "$*"
}

function gcob {
    git checkout -b "$*"
}

function ghpr {
    gh pr create --title "$*"
}

# other
alias l='ls -lah --color'
alias ..="cd .."
alias senv="source ~/.zshrc && cd ."
alias c="clear"
alias e="exit"

# tar
alias tardir='tar -czvf "$1"'
alias untarzippeddir='tar -xzvf "$1" "$2"'
alias untardir='tar -xvf "$1"'

# zsh plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
