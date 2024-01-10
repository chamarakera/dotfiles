export PATH=$PATH:/opt/homebrew/bin
eval $(brew shellenv)

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
alias kexec="kubectl exec --stdin --tty $1 -- /bin/bash"
alias debug="kubectl run -i --tty --rm debug --image=ubuntu:latest --restart=Never -- /bin/bash"
alias debugalpine="kubectl run -i --tty --rm debug --image=alpine:3.7 --restart=Never -- /bin/sh"

# terraform
alias tf="terraform"
alias tfp='terraform plan'
alias tfi='terraform init'
alias tfm='terraform fmt -recursive'

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

gacp() {
    git add . && git commit -m "$*" && git push
}

gc(){
    git commit -m "$*"
}

gco(){
    git checkout "$*"
}

gcob(){
    git checkout -b "$*"
}

ghpr()(
    gh pr create --title "$*"
)

# other
alias l='ls -lah --color'
alias ..="cd .."
alias senv="source ~/.zshrc && cd ."

# tar
alias tardir='tar -czvf "$1"'
alias untarzippeddir='tar -xzvf "$1" "$2"'
alias untardir='tar -xvf "$1"'
