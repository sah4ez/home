alias plt-stage="ssh sah4ez@$STAGE"
alias kc='kubectl'
alias kcks='kubectl --namespace=kube-system'
alias dm="docker-machine"
alias mk="minikube"
alias wd="cd $HOME/go/src/bitbucket.org/$COMPANY/"
alias dev-contacts="sh $HOME/$COMPANY.io/autologginer/get_buffer.sh"
alias branches='for l in $(ls -d msg-* | xargs); do cd $l; printf "%-30s | %-30s\n" "$l" "$(git br | grep \*)" ; cd .. ; done'
