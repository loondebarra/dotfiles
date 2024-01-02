export PATH="$HOME/Scripts:$HOME/.local/bin:$HOME/:$PATH"
export GOPATH=$HOME/go

export WINE_LARGE_ADDRESS_AWARE=0
export PROTON_FORCE_LARGE_ADDRESS_AWARE=0

export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

# fzf list search
bind -x '"\C-r": READLINE_LINE=$(history | fzf +s --tac | sed "s/ *[0-9]* *//")'

export TERM="xterm-256color"

git_branch() {
  # check if current dir is a git repo
  git rev-parse --is-inside-work-tree > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    # get current git branch
    git_branch=$(git branch --show-current 2>/dev/null)
    if [ -n "$git_branch" ]; then
      echo " $git_branch"
    fi
  fi
}

RESET="\[\e[0m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
CYAN="\[\e[36m\]"
YELLOW="\[\e[33m\]"

PS1="${GREEN}\u${RESET}@${BLUE}\h ${CYAN}\w${RESET}\$(git_branch) ${YELLOW}=> ${RESET}"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

