alias plt-stage="ssh sah4ez@${STAGE}"
alias plt-temp="ssh root@${TMP_REMOTE_WORKSPACE}"
alias ot-dev="ssh sah4ez@${OT_DEV}"
alias kc='kubectl'
alias kcks='kubectl --namespace=kube-system'
alias dm="docker-machine"
alias mk="minikube"
alias wd="cd $HOME/go/src/bitbucket.org/$COMPANY/"
alias dev-contacts="sh $HOME/$COMPANY.io/autologginer/get_buffer.sh"
alias branches='for l in $(ls -d msg-* | xargs); do cd $l; printf "%-30s | %-30s\n" "$l" "$(git br | grep \*)" ; cd .. ; done'
alias tags='for l in $(ls -d msg-* | xargs); do cd $l; printf "%-30s | %-30s\n" "$l" "$(git tag -l  | tail -n 1 )" ; cd .. ; done'
alias c='xclip'
alias v='xclip -o'

alias mongodev="mongo --host ${MONGO_PLT_DEV}"
alias mongostage="mongo --host ${MONGO_PLT_STG}"
