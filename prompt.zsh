local SIGNALS=($(kill -l))

function prompt_error {
    local err=$1
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

function last_cmd_status {
    local err=$1
    if [[ $err -eq 0 ]]
    then
        echo "%F{green}"$'\U2705'"%f"
    else
        echo "%F{red}"$(prompt_error $err)"%f"
    fi
}

function show_time {
    echo "%F{cyan}%*%f"
}

function show_path {
    echo "%F{yellow}%~%f"
}

function show_git {
    local gitinfo=$(__git_ps1)
    if [[ $gitinfo != "" ]]
    then
        echo "%F{magenta}$gitinfo%f"
    fi
}

setopt PROMPT_SUBST

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
PROMPT=$'\n''$(last_cmd_status $?) $(show_time) $(show_path)$(show_git)'$'\n'"> "
