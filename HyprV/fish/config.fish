set -gx EDITOR nvim

set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config

set -x GPG_TTY (tty)

set NEXT_TELEMETRY_DISABLED 1

set PG_CONFIG /Applications/Postgres.app/Contents/Versions/latest/bin
fish_add_path $PG_CONFIG

alias cat='bat --theme="Catppuccin-mocha"'
alias grep="rg"
alias ll="exa -l -g --icons --git"
alias llt="exa -1 --icons --tree --git-ignore"
alias td="tmux detach"
alias website="tmux attach-session -t website"
alias lg="lazygit"
alias nvim="nvim --listen /tmp/nvim.pipe"


set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

set -gx FOUNDRY_DIR "$HOME/.foundry"
set -gx PATH "$FOUNDRY_DIR" $PATH

set FOUNDRY_BIN $HOME/.foundry/bin
fish_add_path $FOUNDRY_BIN

set -gx BUN_INSTALL "$HOME/.bun"
set -gx PATH "$BUN_INSTALL/bin" $PATH
set -gx PATH "$HOME/.local/bin" $PATH

eval (starship init fish)
pokemon-colorscripts -s -n "lugia" --no-title
