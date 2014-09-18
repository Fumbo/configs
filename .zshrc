# The following lines were added by compinstall

setopt prompt_subst
setopt glob_dots

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
setopt extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# VCS Support
autoload -Uz vcs_info

zstyle ':vcs_info:*' actionformats \
    '%F{75}[%F{214}%b%F{214}|%F{214}%a%F{75}]%f'
zstyle ':vcs_info:*' formats \
    '%F{75}[%F{214}%b%F{75}]%f'
zstyle ':vcs_info:*' enable git hg

precmd ()
{
    vcs_info
}


## Aliases
alias emacs='emacs -nw'
# Open multiple files in differents tab
alias vim='vim -p'
alias valgrindfull='valgrind --leak-check=full --track-origins=yes'
alias nuke='sudo ~/configs/nuke/nuke.sh'
alias rat='tmux attach-session'
alias se='sudoedit'
alias ls='ls --color=auto -G'
alias l='ls -l'
alias la='ls -la'
alias idea='/home/cadet_l/local/idea/bin/idea.sh'
alias reload='source ~/.zshrc'
alias Gcc='gcc -Wall -Wextra -Werror -std=c99 -pedantic'
alias G++='g++ -Wall -Wextra -Werror -pedantic -std=c++11'
alias lock='i3lock -c 000000'

## Exports
export PROMPT='%F{33}%n% %F{75}@%F{33}%m% %F{75}[%F{222}%~% %F{75}]%F{75}$%f '
export RPROMPT='${vcs_info_msg_0_}'
export PAGER='most'
export PATH="$PATH"
export EDITOR='vim'
export TERM='xterm-256color'

# Function to use for easy color choising
function spectrum_ls() {
for code in {000..255}; do
    print -P -- "$code: %F{$code}Test%f";
done;
        }
