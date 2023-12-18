# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###----Path----###
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH=$HOME/.config/zsh
export LANG="en_US.UTF-8"
export EDITOR='nvim'

if [[ "$(uname)" == "Darwin" ]]; then
[[ -f $ZSH/zshrc.mac ]] && source $ZSH/zshrc.mac
elif [[ "$(uname)" == "Linux" ]]; then
[[ -f $ZSH/zshrc.linux ]] && source $ZSH/zshrc.linux
fi

###----Zinit's installer----###
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

###----End of Zinit's installer----###


###----Zinit's config----###
zinit light-mode for \
    depth"1" \
  romkatv/powerlevel10k \
    depth"1" \
  jeffreytse/zsh-vi-mode \
    blockf \
  zsh-users/zsh-completions \
  zdharma-continuum/fast-syntax-highlighting \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-history-substring-search\
  ael-code/zsh-colored-man-pages \

# OMZ Lib
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::theme-and-appearance.zsh
# OMZ Plugins
zinit snippet OMZP::git
zinit snippet OMZP::history
zinit snippet OMZP::safe-paste

###----End of Zinit's config----###

###----aliases----###
[[ -f $ZSH/aliases.zsh ]] && source $ZSH/aliases.zsh

###----key bindings----###
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

###----p10k----###
[[ ! -f $ZSH/p10k.zsh ]] || source $ZSH/p10k.zsh

###----zoxide----###
eval "$(zoxide init zsh)"

###----completions----###
autoload -Uz compinit; compinit
zinit cdreplay -q
