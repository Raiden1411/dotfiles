#!/bin/bash

# Install Bun
curl -fsSL https://bun.sh/install | bash
# Install Lvim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
cp -R ~/.config/HyprV/lvim/ ~/.config/
# Install Foundry
curl -L https://foundry.paradigm.xyz | bash

# Configure Fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
cat ~/.config/fish/fish_plugins | fisher install $1
fish_config theme save "Catppuccin Mocha"

# Install pnpm
bun add -g pnpm