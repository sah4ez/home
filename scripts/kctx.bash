#!/usr/bin/env bash

_kctx() 
{
	old_context=$(cat ${HOME}/.kube/config | grep current-context | awk -F\" '{print $2}')

    local cur 
	_init_completion || return
	opts=$(cat ${HOME}/.kube/config | yq '.contexts[].name' -r | awk 'ORS=" "' | sed -r "s/${old_context}//g;s/  / /g" )

    if [[ ${cur} == * ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" ${cur}) )
        return 0
    fi
} && complete -F _kctx kctx


