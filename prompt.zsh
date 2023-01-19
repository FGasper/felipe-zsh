local SIGNALS=($(kill -l))

function prompt_error {
    local err=$?
    if [[ $err -gt 128 ]]
    then
        local signum
        (( signum = $err - 128 ))
        local signame=${SIGNALS[signum]}

        if [[ $signame != "" ]]
        then
            echo "SIG$signame"
            return
        fi
    fi

    echo "exit:$err"
}

setopt PROMPT_SUBST
PROMPT=$'\n'"%(?.%F{green}"$'\U2705'"%f.%F{red}"'$(prompt_error)'"%f) %F{cyan}%*%f %F{yellow}%~%f"$'\n'"> "
