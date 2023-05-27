lvim.plugins = {
  { 'jose-elias-alvarez/typescript.nvim' },
  {
    "catppuccin/nvim"
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      })
    end
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          options = {
            number = false
          }
        }
      }
    end
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  { "tpope/vim-surround" },
  { "tpope/vim-eunuch" },
  { "tpope/vim-repeat" },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup()
    end,
  },
  {
    "marilari88/twoslash-queries.nvim",
    config = function()
      require("twoslash-queries").setup({
        multi_line = true,  -- to print types in multi line mode
        is_enabled = false, -- to keep disabled at startup and enable it on request with the EnableTwoslashQueries
      })
    end,
  },
  { "virchau13/tree-sitter-astro" }
}

-- require("lspconfig")["tsserver"].setup({
--   on_attach = function(client, bufnr)
--      require("twoslash-queries").attach(client, bufnr)
--   end,
-- })
