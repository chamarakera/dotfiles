export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.asdf/shims:$PATH

# ohmyposh
export DEFAULT_USER=$USER
eval "$(oh-my-posh init zsh --config /opt/homebrew/opt/oh-my-posh/themes/jandedobbeleer.omp.json)"

# kubernetes
alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"
alias kg="kubectl get"
alias kxu="kubectl config unset current-contextg"

# terraform
alias tf="terraform"
alias tfp='terraform plan'
alias tfi='terraform init'
alias tfm='terraform fmt -recursive'

# python
alias pip="pip3"
alias p="python"

# git
# alias ga='git add -A'
# alias gc='git commit -m $2'
# alias gp='git push'
gacp() {
    git add . && git commit -m "$*" && git push
}

# alias gco='git checkout $1'
# alias gpst='git push --set-upstream origin $1'
