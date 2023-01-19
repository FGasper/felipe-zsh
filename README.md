1. Clone this repo to `~/.zsh`.

2. Set this in `~/.zshrc`:
```
fpath=(~/.zsh/functions $fpath)

for FILE in ~/.zsh/*.zsh; do
	source $FILE
done
```
