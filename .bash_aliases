alias plt-stage="ssh sah4ez@${STAGE}"
alias plt-temp="ssh root@${TMP_REMOTE_WORKSPACE}"
alias ot-dev="ssh sah4ez@${OT_DEV}"
alias kc='kubectl'
alias osdk='operator-sdk'
alias kcks='kubectl --namespace=kube-system'
alias dm="docker-machine"
alias mk="minikube"
alias wd="cd $HOME/go/src/bitbucket.org/$COMPANY/"
alias ffwd="cd $HOME/go/src/${PRIVATE_REPOS}/${COMPANY2}/"
alias dev-contacts="sh $HOME/$COMPANY.io/autologginer/get_buffer.sh"
alias branches='for l in $(ls -d msg-* | xargs); do cd $l; printf "%-30s | %-30s\n" "$l" "$(git br | grep \*)" ; cd .. ; done'
alias tags='for l in $(ls -d msg-* | xargs); do cd $l; printf "%-30s | %-30s\n" "$l" "$(git tag -l  | tail -n 1 )" ; cd .. ; done'
alias c='xclip'
alias v='xclip -o'
alias cwd='pwd | xclip'
alias vwd='cd $(if [ $(xclip -o | wc -w) -eq 1 ] && [ "$(xclip -o)" ]; then echo $(xclip -o); else echo "empty copied path. tips: use cwd" >> /dev/stderr; fi)'
alias chrome='google-chrome --proxy-server="socks5://127.0.0.1:9050"'
alias findd='find . -type d'
alias findf='find . -type f'
alias plantuml="java -jar ${HOME}/.opt/plantuml.jar"
alias openapi-diff2="java -jar ${HOME}/bin/openapi-diff.jar"
alias jwt-exp="awk -F \".\" '{print \$2 \"==\" }' | base64 -d | jq '.exp' | xargs printf '@%s\n' | xargs date --date"

alias mongodev="mongo --host ${MONGO_PLT_DEV}"
alias mongostage="mongo --host ${MONGO_PLT_STG}"

alias jiradm="jira create --project=${ADMIN_SPACE} --browse"
