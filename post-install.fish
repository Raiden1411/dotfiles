#!/bin/fish

# Install Bun
curl -fsSL https://bun.sh/install | bash

# Install Foundry
curl -L https://foundry.paradigm.xyz | bash

# Configure Fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
cat ~/.config/fish/fish_plugins | fisher install $1
fish_config theme save "Catppuccin Mocha"

# Install pnpm
bun add -g pnpm

cp  ~/.config/HyprV/VSCodium/User/settings.json ~/.config/VSCodium/User/settings.json
