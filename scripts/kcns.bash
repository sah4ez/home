#!/usr/bin/env bash

_kcns() 
{
	old_ns=`cat /tmp/kcns\$(tty)/current 2> /dev/null`
	if [ "${old_ns}" == "" ]; then
		old_ns="NONE"
	fi

    local cur 
	_init_completion || return
	opts=$(kc get ns -ojsonpath='{$.items[*].metadata.name}' 2> /dev/null | sed -r "s,${old_ns},,g;s,  , ,g")

    if [[ ${cur} == * ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" ${cur}) )
        return 0
    fi
} && complete -F _kcns kcns


