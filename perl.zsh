function perlmodulepath {
    echo $1 | sed -E 's/::/\//g; s/^([^.]+)$/\1.pm/'
}

function mvimpm {
    mvim `perlmodulepath $1`
}

function vimpm {
    vim `perlmodulepath $1`
}
