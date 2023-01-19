path=(/usr/local/go/bin $path)

function {
	local gobin=$(go env GOBIN)

	# cf. go help install
	if [ -z "$gobin" ]; then
		local gopath=$(go env GOPATH)
		if [ -z "$gopath" ]; then
			gopath=$HOME/go/bin
		fi
		gobin=$gopath/bin
	fi

	path=($gobin $path)
}
