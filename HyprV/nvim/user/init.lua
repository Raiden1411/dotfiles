-- Load in the headers
local headers = require("user.headers")
math.randomseed(os.time())

--  ▄████████  ▄██████▄  ███▄▄▄▄      ▄████████  ▄█     ▄██████▄
-- ███    ███ ███    ███ ███▀▀▀██▄   ███    ███ ███    ███    ███
-- ███    █▀  ███    ███ ███   ███   ███    █▀  ███▌   ███    █▀
-- ███        ███    ███ ███   ███  ▄███▄▄▄     ███▌  ▄███
-- ███        ███    ███ ███   ███ ▀▀███▀▀▀     ███▌ ▀▀███ ████▄
-- ███    █▄  ███    ███ ███   ███   ███        ███    ███    ███
-- ███    ███ ███    ███ ███   ███   ███        ███    ███    ███
-- ████████▀   ▀██████▀   ▀█   █▀    ███        █▀     ████████▀
local config = {
	-- Configure AstroNvim updates
	updater = {
		remote = "origin",   -- remote to use
		channel = "stable", -- "stable" or "nightly"
		version = "latest",  -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		pin_plugins = nil,   -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_quit = false,   -- automatically quit the current session after a successful update
	},
	-- Set colorscheme to use
	colorscheme = "catppuccin",
	-- Add highlight groups in any theme
	-- set vim options here (vim.<first_key>.<second_key> = value)
	options = {
		opt = {
			-- set to true or false etc.
			relativenumber = true, -- sets vim.opt.relativenumber
			number = true,      -- sets vim.opt.number
			spell = false,      -- sets vim.opt.spell
			signcolumn = "auto", -- sets vim.opt.signcolumn to auto
			wrap = false,       -- sets vim.opt.wrap
		},
		g = {
			mapleader = " ",                -- sets vim.g.mapleader
			autoformat_enabled = true,      -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
			cmp_enabled = true,             -- enable completion at start
			autopairs_enabled = true,       -- enable autopairs at start
			diagnostics_enabled = true,     -- enable diagnostics at start
			status_diagnostics_enabled = true, -- enable diagnostics in statusline
			icons_enabled = true,           -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
			ui_notifications_enabled = true, -- disable notifications when toggling UI elements
		},
	},
	-- If you need more control, you can use the function()...end notation
	-- options = function(local_vim)
	--   local_vim.opt.relativenumber = true
	--   local_vim.g.mapleader = " "
	--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
	--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
	--
	--   return local_vim
	-- end,

	-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
	diagnostics = {
		virtual_lines = false,
		virtual_text = true,
		underline = true,
	},
	-- Extend LSP configuration
	lsp = {
        servers = {
			-- Nomic solidity LSP
			"nomic_solidity",
		},
		formatting = {
			-- control auto formatting on save
			format_on_save = {
				enabled = true, -- enable or disable format on save globally
				allow_filetypes = { -- enable format on save for specified filetypes only
					-- "go",
				},
				ignore_filetypes = { -- disable format on save for specified filetypes
					"solidity",
				},
			},
			disabled = { -- disable formatting capabilities for the listed language servers
				-- "sumneko_lua",
			},
			timeout_ms = 1000, -- default format timeout
			-- filter = function(client) -- fully override the default formatting function
			--   return true
			-- end
		},
		-- easily add or disable built in mappings added during LSP attaching
		mappings = {
			n = {
				-- ["<leader>lf"] = false -- disable formatting keymap
			},
		},
		-- add to the global LSP on_attach function
		-- on_attach = function(client, bufnr)
		-- end,

		-- override the LSP setup handler function based on server name
		setup_handlers = {
			-- first function changes the default setup handler
			-- function(server, opts)
			--   require("lspconfig")[server].setup(opts)
			-- end,
			-- -- keys for a specific server name will be used for that LSP
			-- sumneko_lua = function(server, opts)
			--   -- custom sumneko_lua setup handler
			--   require("lspconfig")["sumneko_lua"].setup(opts)
			-- end,
			rust_analyzer = function(_, opts)
				require("rust-tools").setup({ server = opts })
			end,
		},
		-- Add overrides for LSP server settings, the keys are the name of the server
		config = {
			-- example for addings schemas to yamlls
			yamlls = {
				-- override table for require("lspconfig").yamlls.setup({...})
				settings = {
					yaml = {
						schemas = {
							["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
							["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
							["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
						},
					},
				},
			},
            nomic_solidity = {
				cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
				-- root_dir = require("lspconfig.util").root_pattern("foundry.toml"),
				filetypes = { "solidity" },
				single_file_support = true,
			},
		},
	},
	-- Mapping data with "desc" stored directly by vim.keymap.set().
	--
	-- Please use this mappings table to set keyboard mapping since this is the
	-- lower level configuration and more robust one. (which-key will
	-- automatically pick-up stored data by this setting.)
	mappings = {
		-- first key is the mode
		n = {
			-- second key is the lefthand side of the map
			-- mappings seen under group name "Buffer"
			-- tables with the `name` key will be registered with which-key if it's installed
			-- this is useful for naming menus
			--
			-- Buffer mappings
			["<leader>b"] = { name = "Buffers" },
			["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
			["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
			["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
			["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
			-- ctrl+D / ctrl+U to scroll up and down
			["<C-d>"] = { "<C-d>zz", desc = "Scroll one half page down" },
			["<C-u>"] = { "<C-u>zz", desc = "Scroll one half page up" },
            -- twoslash
            ["<C-k>"] = { "<cmd>InspectTwoslashQueries<CR>", desc = "Inline type definition" },
			-- LSP Lines toggle
			["<leader>1"] = {
				function()
					require("lsp_lines").toggle()
					local virtual_lines_enabled = vim.diagnostic.config().virtual_lines
					vim.diagnostic.config({ virtual_text = not virtual_lines_enabled })
				end,
				desc = "Toggle LSP Lines diagnostics",
			},
			-- Grep in file
			["<leader>fv"] = {
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Search words in file",
			},
		},
		t = {
			-- setting a mapping to false will disable it
			-- ["<esc>"] = false,
		},
	},
	-- Configure require("lazy").setup() options
	lazy = {
		defaults = { lazy = true },
		performance = {
			rtp = {
				-- customize default disabled vim plugins
				disabled_plugins = {
					"tohtml",
					"gzip",
					"matchit",
					"zipPlugin",
					"netrwPlugin",
					"tarPlugin",
					"matchparen",
				},
			},
		},
	},
	-- Configure plugins
	plugins = {
		----------------------------------------------------------------
		--                      CONFIG OVERRIDES                      --
		----------------------------------------------------------------

		-- Alpha Dashboard Headers
		{
			"goolord/alpha-nvim",
			opts = function(_, opts)
				-- customize the dashboard header
				opts.section.header.val = headers[math.random(#headers)]
				return opts
			end,
		},

		-- Override Heirline Config
		{
			"rebelot/heirline.nvim",
		},

		----------------------------------------------------------------
		--                          PLUGINS                           --
		----------------------------------------------------------------
        
        -- Todo commentsy
        {
            "folke/todo-comments.nvim",
            event = "BufRead",
            config = function()
              require("todo-comments").setup()
            end
        },
        
		-- Catppuccin
		{
			"catppuccin/nvim",
			lazy = false,
			opt = false,
			as = "catppuccin",
			config = function()
				-- latte, frappe, macchiato, mocha
                vim.g.catppuccin_flavour = "mocha"
				-- local colors = require("catppuccin.palettes").get_palette()
				require("catppuccin").setup({
					transparent_background = false,
					term_colors = false,
					styles = {
						comments = { "italic" },
						functions = { "italic", "bold" },
						keywords = { "italic" },
					},
					background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
					show_end_of_buffer = false, -- show the '~' characters after the end of buffers
					dim_inactive = {
						enabled = false,
						shade = "dark",
						percentage = 0.15,
					},
					integrations = {
						cmp = true,
						gitsigns = true,
						nvimtree = true,
						telescope = true,
						notify = false,
						mini = false,
						-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
					}
				})
			end,
		},

		-- lsp_lines (pretty diagnostics)
		{
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			lazy = false,
			after = "mason-lspconfig.nvim",
			module = "lsp_lines",
			config = function()
				require("lsp_lines").setup()
			end,
		},
        
        -- twoslash
        {
            "marilari88/twoslash-queries.nvim",
            config = function()
              require("twoslash-queries").setup({
                multi_line = true,  -- to print types in multi line mode
                is_enabled = false, -- to keep disabled at startup and enable it on request with the EnableTwoslashQueries
              })
            end,
          },

		-- Leap
		{
			"ggandor/leap.nvim",
			lazy = false,
			config = function()
				local leap = require("leap")
				leap.setup({
					highlight_unlabeled_phase_one_targets = false,
				})
				leap.add_default_mappings()
			end,
		},

		-- Rainbow brackets
		{ "p00f/nvim-ts-rainbow",     lazy = false },

		-- Bionic Reading
		{ "nullchilly/fsread.nvim",   lazy = false },
        -- Tmux
        { "christoomey/vim-tmux-navigator", lazy = false},
        -- Eunuch
        { "tpope/vim-eunuch" },    
	},
	-- Custom icons
	icons = {
		VimIcon = "",
	},
	-- Customize Heirline options
	heirline = {
		separators = {
			left = { "", " " }, -- separator for the left side of the statusline
			right = { " ", "" }, -- separator for the right side of the statusline,
		},
	},
	-- This function is run last and is a good place to configuring
	-- augroups/autocommands and custom filetypes also this just pure lua so
	-- anything that doesn't fit in the normal config locations above can go here
	polish = function()
		-- Set up notify background color (Fixes warning)
		require("notify").setup({
			background_colour = "#000000",
		})

		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true,
			},
            ensure_installed = {
                "bash",
                "c",
                "javascript",
                "json",
                "lua",
                "python",
                "typescript",
                "tsx",
                "css",
                "rust",
                "java",
                "yaml",
                "solidity",
                "astro",
                "zig"
            },
		})

        require("lspconfig")["tsserver"].setup({
            on_attach = function(client, bufnr)
                require("twoslash-queries").attach(client, bufnr)
            end,
        })

        require("mason-lspconfig").setup {
            ensure_installed = { 
                "lua_ls", 
                "tsserver", 
                "bashls", 
                "solidity_ls_nomicfoundation", 
                "taplo", 
                "tailwindcss", 
                "zls" 
            },
        }
	end,
}

require("user.filetype")
return config