# Bash alias for ubuntu and jianguoyun
## Command
`mkwc` : make work sapce and content space
## Usage
`ln -s ${PWD}/custom.bash_aliases ${HOME}/.bash_aliases`

Notice thatthe .bashrc file should have these sentences by default:
``` bash
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```
