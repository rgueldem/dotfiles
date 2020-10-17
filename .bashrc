alias tmate-ssh="tmate display -p '#{tmate_ssh}'"

export PATH=$PATH:~/bin
export EDITOR=vim

# git
source ~/dotfiles/git-completion.bash
source ~/dotfiles/git-prompt.sh

#export PS1='\h:\W$(__git_ps1 " %s")$ '
export PS1='$ '

# rbenv
eval "$(rbenv init -)"

source ~/.bashrc_work
