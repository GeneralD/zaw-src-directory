#!/usr/bin/env zsh

function zaw-src-cdd () {
    if [ -r "$CDD_PWD_FILE" ]; then
        for window in `cat $CDD_PWD_FILE | sed '/^$/d'`; do
            candidates+=("${window}")
        done
        actions=(zaw-src-cdd-cd)
        act_descriptions=("cdd for zaw")
    fi
}

function zaw-src-cdd-cd () {
    BUFFER="cd `echo $1 | cut -d ':' -f 2`"
    zle accept-line
}

zaw-register-src -n cdd zaw-src-cdd
