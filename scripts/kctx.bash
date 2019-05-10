#!/usr/bin/env bash

_kctx()
{
	old_context=$(cat ${HOME}/.kube/config | grep current-context | awk -F:\  '{print $2}' | sed 's/"//g')

    local cur
	_init_completion || return
	opts=$(cat ~/.kube/config | yq r - contexts[*].name  | sed 's/- //g' | awk 'ORS=" "' | sed -r "s/${old_context}//g;s/  / /g" )

    if [[ ${cur} == * ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" ${cur}) )
        return 0
    fi
} && complete -F _kctx kctx


