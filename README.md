# Dotfiles

## Overview

- Dotfiles use [dotbot][dotbot] and [Brew][brew] for installation
- [Zint][zinit] for zsh
- [LazyVim][lazyvim] for nvim

## Requirements

- [Brew][brew] installed

## Setup

**⚠️ Before starting, backup your configs**

```zsh
chsh -s $(which zsh)
cd ~
git clone https://github.com/Terry-TF/dotfiles
cd ~/dotfiles
./install
```

## Local Custom

Edit the `*.local` files as per your requirements.

- `git/gitignore.local`
- ...

## License

Copyright (c) Terry Feng. Released under the MIT License. See
[LICENSE][license] for details.

[dotbot]: https://github.com/anishathalye/dotbot
[zinit]: https://github.com/zdharma-continuum/zinit
[brew]: https://brew.sh
[lazyvim]: https://github.com/LazyVim/LazyVim
[license]: LICENSE
