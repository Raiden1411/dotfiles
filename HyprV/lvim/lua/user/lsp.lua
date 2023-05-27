local lvim_lsp = require('lvim.lsp')
local ts = require('typescript')

-- configure tsserver server manually.
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" }, 0, 0)

local common_on_attach = lvim_lsp.common_on_attach
local common_capabilities = lvim_lsp.common_capabilities()

lvim.lsp.on_attach_callback = function(client, bufnr)
  if lvim.colorscheme == 'gruvbox' then
    -- change coloring of errors so I can actually read them with gruvbox
    vim.cmd(':hi DiagnosticError guifg=#de5b64 guibg=#1C1C1C')
    vim.cmd(':hi DiagnosticWarn guifg=DarkOrange ctermfg=DarkYellow')
    vim.cmd(':hi DiagnosticInfo guifg=Cyan ctermfg=Cyan')
    vim.cmd(':hi DiagnosticHint guifg=White ctermfg=White')
  end
  require("twoslash-queries").attach(client, bufnr)
end


-- Typescript config using typescript.nvim
ts.setup({
  server = {
    root_dir = require('lspconfig.util').root_pattern('.git'),
    capabilities = common_capabilities,
    on_attach = common_on_attach
  },
})

-- local lsp_manager = require("lvim.lsp.manager")
-- lsp_manager.setup("tsserver", {
--   on_attach = function(client, bufnr)
--     require("twoslash-queries").attach(client, bufnr)
--   end,
-- })

-- -- Keeping this here for reference
-- require("lvim.lsp.manager").setup("tsserver", {
--   root_dir = require('lspconfig.util').root_pattern('.git'),
--   on_attach = common_on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
--   cmd = {
--     "typescript-language-server",
--     "--stdio",
--   },
-- })
--
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup({
--   {
--     command = "prettierd",
--     filetypes = {
--       "javascript",
--       "javascriptreact",
--       "typescript",
--       "typescriptreact",
--       "vue",
--       "css",
--       "scss",
--       "less",
--       "html",
--       "yaml",
--       "markdown",
--       "markdown.mdx",
--       "graphql",
--       "handlebars",
--       "json",
--     }
--   },
-- })

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup({
--   {
--     command = "eslint_d",
--     filetypes = { "javascript", "typescript", "typescriptreact", "json" }
--   },
-- })
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  {
    command = "prettierd",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "html",
      "yaml",
      "markdown",
      "markdown.mdx",
      "json",
    }
  },
})

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup({
--   {
--     command = "eslint_d",
--     filetypes = { "javascript", "typescript", "typescriptreact", "json" }
--   },
-- })
-- local formatters = require "lvim.lsp.null-ls.formatters"

-- formatters.setup({
--   {
--     command = "rome",
--     filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json" },
--     args = { "format", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--write", "--config-path", "~/.config/" }
--   },
-- })

-- local linters = require "lvim.lsp.null-ls.linters"

-- linters.setup({
--   {
--     command = "rome",
--     filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json" },
--     args = { "check", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--config-path", "~/.config/" }
--   },
-- })
-- formatters.setup({
--   {
--     filetypes = {
--       typescript = {
--         function()
--           return {
--             exe = "rome",
--             args = { "format", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--config-path",
--               "~/.config/", "--write" },
--             stdin = true
--           }
--         end
--       },
--       typescriptreact = {
--         function()
--           return {
--             exe = "rome",
--             args = { "format", "--stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
--             stdin = true
--           }
--         end
--       },
--       javascript = {
--         function()
--           return {
--             exe = "rome",
--             args = { "format", "--stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
--             stdin = true
--           }
--         end
--       },
--       javascriptreact = {
--         function()
--           return {
--             exe = "rome",
--             args = { "format", "--stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
--             stdin = true
--           }
--         end
--       },
--       json = {
--         function()
--           return {
--             exe = "rome",
--             args = { "format", "--stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
--             stdin = true
--           }
--         end
--       },
--     }
--   } })

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup({
--   {
--     filetypes = {
--       typescript = {
--         function()
--           return {
--             exe = "rome",
--             args = { "check", "--stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
--             stdin = true
--           }
--         end
--       },
--       typescriptreact = {
--         function()
--           return {
--             exe = "rome",
--             args = { "check", "--stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
--             stdin = true
--           }
--         end
--       },
--       javascript = {
--         function()
--           return {
--             exe = "rome",
--             args = { "check", "--stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
--             stdin = true
--           }
--         end
--       },
--       javascriptreact = {
--         function()
--           return {
--             exe = "rome",
--             args = { "check", "--stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
--             stdin = true
--           }
--         end
--       },
--       json = {
--         function()
--           return {
--             exe = "rome",
--             args = { "check", "--stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
--             stdin = true
--           }
--         end
--       },
--     }
--   },
-- })

lvim.lsp.diagnostics.float.max_width = 120
lvim.lsp.diagnostics.float.focusable = true
