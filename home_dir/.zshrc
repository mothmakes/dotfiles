#
# zsh
#

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mothwing/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#
# fzf
#

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# starship
#

eval "$(starship init zsh)"

#
# Environmental Variables
#

PATH="/home/mothwing/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/mothwing/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/mothwing/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/mothwing/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/mothwing/perl5"; export PERL_MM_OPT;
PATH="$HOME/.local/bin/Godot${PATH:+:${PATH}}"; export PATH;

#
# Aliases
#

alias ls=exa
alias ll="exa -alh"
alias tree="exa --tree"
alias cat="batcat"
alias search="rg"
alias ff="fzf"
alias cd="z"
alias zz="z -"
alias vim="nvim"
alias godot="godot.x86_64"

#
# zoxide
#

eval "$(zoxide init zsh)"
