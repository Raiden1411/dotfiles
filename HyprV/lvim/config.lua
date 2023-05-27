vim.opt.shell = "/bin/sh"

reload('user.plugins')
reload('user.colorscheme')
reload('user.options')
reload('user.keymaps')
reload('user.which-key')
reload('user.statusline')
reload('user.lsp')
reload('user.dashboard')
reload('user.autocmds')

-- --[[
-- lvim is the global options object

-- Linters should be
-- filled in as strings with either
-- a global executable or a path to
-- an executable
-- ]]
-- -- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- -- general
-- --lvim.log.level = "warn"
-- lvim.format_on_save = true
-- lvim.colorscheme = "catppuccin"
-- -- to disable icons and use a minimalist setup, uncomment the following
-- -- lvim.use_icons = false
-- --
-- vim.opt.gdefault = true
-- vim.opt.ignorecase = true
-- vim.opt.linebreak = true

-- vim.filetype.add({
--   extensions = {
--     astro = "astro"
--   }
-- })

-- -- keymappings [view all the defaults by pressing <leader>Lk]
-- lvim.leader = "space"
-- -- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- -- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- -- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- -- unmap a default keymapping
-- -- vim.keymap.del("n", "<C-Up>")
-- -- override a default keymapping
-- -- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- -- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- -- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- -- local _, actions = pcall(require, "telescope.actions")
-- -- lvim.builtin.telescope.defaults.mappings = {
-- --   -- for input mode
-- --   i = {
-- --     ["<C-j>"] = actions.move_selection_next,
-- --     ["<C-k>"] = actions.move_selection_previous,
-- --     ["<C-n>"] = actions.cycle_history_next,
-- --     ["<C-p>"] = actions.cycle_history_prev,
-- --   },
-- --   -- for normal mode
-- --   n = {
-- --     ["<C-j>"] = actions.move_selection_next,
-- --     ["<C-k>"] = actions.move_selection_previous,
-- --   },
-- -- }
-- lvim.builtin.gitsigns.active = true;
-- lvim.builtin.gitsigns.opts.current_line_blame = true;
-- -- Change theme settings
-- -- lvim.builtin.theme.options.dim_inactive = true
-- -- lvim.builtin.theme.options.style = "storm"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["k"] = { "<cmd>Telescope buffers<CR>", "Search Buffers" }
-- lvim.builtin.which_key.mappings["g"] = { "<cmd>Telescope grep_string<CR>", "Grep in dir" }
-- -- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- -- lvim.builtin.which_key.mappings["t"] = {
-- --   name = "+Trouble",
-- --   r = { "<cmd>Trouble lsp_references<cr>", "References" },
-- --   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
-- --   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
-- --   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
-- --   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
-- --   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- -- }
-- lvim.builtin.which_key.mappings["L"]["t"] = { "<cmd>LvimToggleFormatOnSave<cr>", "ToggleFormatOnSave" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "Diagnostics",
--   t = { "<cmd>TroubleToggle<cr>", "trouble" },
--   w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
--   d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
--   q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
--   l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
--   r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
-- }
-- -- TODO: User Config for predefined plugins
-- -- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.alpha.active = true
-- lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.terminal.active = true
-- lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.telescope.defaults.path_display = {
--   shorten = {
--     len = 3,
--     exclude = { 1, -1 }
--   },
--   truncate = true
-- }
-- -- Personal configs
-- lvim.builtin.terminal.open_mapping = "<F7>"
-- lvim.format_on_save = true
-- lvim.lsp.diagnostics.update_in_insert = true


-- -- if you don't want all the parsers change this to a table of the ones you want
-- lvim.builtin.treesitter.ensure_installed = {
--   "bash",
--   "c",
--   "javascript",
--   "json",
--   "lua",
--   "python",
--   "typescript",
--   "tsx",
--   "css",
--   "rust",
--   "java",
--   "yaml",
--   "astro"
-- }

-- lvim.builtin.treesitter.ignore_install = { "haskell" }
-- lvim.builtin.treesitter.highlight.enable = true

-- -- generic LSP settings

-- -- -- make sure server will always be installed even if the server is in skipped_servers list
-- -- lvim.lsp.installer.setup.ensure_installed = {
-- --     "sumneko_lua",
-- --     "jsonls",
-- -- }
-- -- -- change UI setting of `LspInstallInfo`
-- -- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- -- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- -- lvim.lsp.installer.setup.ui.border = "rounded"
-- -- lvim.lsp.installer.setup.ui.keymaps = {
-- --     uninstall_server = "d",
-- --     toggle_server_expand = "o",
-- -- }

-- -- ---@usage disable automatic installation of servers
-- -- lvim.lsp.installer.setup.automatic_installation = false

-- -- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- -- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- -- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- -- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- -- require("lvim.lsp.manager").setup("pyright", opts)

-- -- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- -- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- -- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
-- --   return server ~= "emmet_ls"
-- -- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- -- you can set a custom on_attach function that will be used for all the language servers
-- -- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- -- lvim.lsp.on_attach_callback = function(client, bufnr)
-- --   local function buf_set_option(...)
-- --     vim.api.nvim_buf_set_option(bufnr, ...)
-- --   end
-- --   --Enable completion triggered by <c-x><c-o>
-- --   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- -- end
-- --
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "prettier", filetypes = { "typescript", "typescriptreact" } }
-- }

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   -- { command = "eslint_d", filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" } },
--   {
--     command = "shellcheck",
--     extra_args = { "--severity", "warning" },
--   },
-- }

-- local lsp_manager = require("lvim.lsp.manager")
-- lsp_manager.setup("tsserver", {
--   on_attach = function(client, bufnr)
--     require("twoslash-queries").attach(client, bufnr)
--   end,
-- })

-- -- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- -- local formatters = require "lvim.lsp.null-ls.formatters"
-- -- formatters.setup {
-- --   { command = "black", filetypes = { "python" } },
-- --   { command = "isort", filetypes = { "python" } },
-- --   {
-- --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
-- --     command = "prettier",
-- --     ---@usage arguments to pass to the formatter
-- --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
-- --     extra_args = { "--print-with", "100" },
-- --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
-- --     filetypes = { "typescript", "typescriptreact" },
-- --   },
-- -- }

-- -- -- set additional linters
-- -- local linters = require "lvim.lsp.null-ls.linters"
-- -- linters.setup {
-- --   { command = "flake8", filetypes = { "python" } },
-- --   {
-- --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
-- --     command = "shellcheck",
-- --     ---@usage arguments to pass to the formatter
-- --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
-- --     extra_args = { "--severity", "warning" },
-- --   },
-- --   {
-- --     command = "codespell",
-- --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
-- --     filetypes = { "javascript", "python" },
-- --   },
-- -- }

-- -- Additional Plugins
-- lvim.plugins = {
--   { 'jose-elias-alvarez/typescript.nvim' },
--   {
--     "catppuccin/nvim"
--   },
--   { "tpope/vim-eunuch" },
--   {
--     "folke/trouble.nvim",
--     cmd = "TroubleToggle",
--   },
--   {
--     "folke/todo-comments.nvim",
--     event = "BufRead",
--     config = function()
--       require("todo-comments").setup()
--     end
--   },
--   {
--     "folke/persistence.nvim",
--     event = "BufReadPre",
--     config = function()
--       require("persistence").setup({
--         dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
--         options = { "buffers", "curdir", "tabpages", "winsize" }
--       })
--     end
--   },
--   {
--     "folke/zen-mode.nvim",
--     config = function()
--       require("zen-mode").setup {
--         window = {
--           options = {
--             number = false
--           }
--         }
--       }
--     end
--   },
--   {
--     "christoomey/vim-tmux-navigator",
--   },
--   { "tpope/vim-surround" },
--   { "tpope/vim-eunuch" },
--   { "tpope/vim-repeat" },
--   {
--     "windwp/nvim-ts-autotag",
--     config = function()
--       require("nvim-ts-autotag").setup()
--     end,
--   },
--   {
--     "phaazon/hop.nvim",
--     branch = "v2",
--     config = function()
--       require("hop").setup()
--     end,
--   },
--   {
--     "marilari88/twoslash-queries.nvim",
--     config = function()
--       require("twoslash-queries").setup({
--         multi_line = true, -- to print types in multi line mode
--         is_enabled = true, -- to keep disabled at startup and enable it on request with the EnableTwoslashQueries
--       })
--     end,
--   },
--   { "virchau13/tree-sitter-astro" }
-- }

-- vim.api.nvim_set_keymap('n', "<C-k>", "<cmd>InspectTwoslashQueries<CR>", {})
-- -- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- -- vim.api.nvim_create_autocmd("BufEnter", {
-- --   pattern = { "*.json", "*.jsonc" },
-- --   -- enable wrap mode for json files only
-- --   command = "setlocal wrap",
-- -- })
-- -- vim.api.nvim_create_autocmd("FileType", {
-- --   pattern = "zsh",
-- --   callback = function()
-- --     -- let treesitter use bash highlight for zsh files as well
-- --     require("nvim-treesitter.highlight").attach(0, "bash")
-- --   end,
-- -- })
