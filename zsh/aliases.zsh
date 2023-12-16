# avoid overwrite
alias cp='cp -i'
alias mv='mv -i'

# mkdir
alias mkdir='mkdir -pv'

# cat
alias cat='bat'

# clear
alias cls='clear'

# git
alias g='git'

# lazygit
alias lg='lazygit'

# joshuto
alias jo='joshuto'

# ls
alias ls='eza'
alias la='eza -a'
alias ll='eza -lah'
alias tree='eza --tree'

# neofetch
alias s='neofetch'

# zellij
alias zl='zellij'

# brew
alias brewup='brew update && brew upgrade && brew cleanup'

# Update dotfiles
dfu() {
    (
        cd ~/dotfiles && git pull --ff-only && ./install -q
    )
}
