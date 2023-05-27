local kind = require('user.kind')

local wk = lvim.builtin.which_key

wk.mappings["a"] = { ":Alpha<cr>", kind.icons.screen .. " Dashboard" }

wk.mappings["S"] = {
  name = " persistence.nvim",
  s = { "<cmd>lua require('persistence').load()<cr>", kind.icons.clock .. " Reload last session for dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", kind.icons.clock .. " Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", kind.icons.exit .. " Quit without saving session" },
}

wk.mappings["l"]["t"] = { ":LvimToggleFormatOnSave<cr>", kind.symbols_outline.File .. " Toggle format-on-save" }
wk.mappings["l"]["R"] = { ":LspRestart<cr>", kind.icons.exit .. " Restart" }

wk.mappings["s"]["w"] = {
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<cr>",
  ' ' .. kind.cmp_kind.EnumMember .. " Search Word Under Cursor"
}

wk.mappings["W"] = {
  name = ' ' .. kind.icons.screen .. " Window Ctrl",
  h = { '<C-w>|', 'Maximize window horizontally (|)' },
  v = { '<C-w>_', 'Maximize window vertically (_)' },
  ['='] = { '<C-w>=', 'Resize windows equally' },
  s = { ":lua require('telescope-tabs').list_tabs()<cr>", 'Search Tabs' },
}

wk.mappings["G"] = {
  name = ' ' .. kind.icons.hint .. " Github Copilot",
  a = { ":lua require('copilot.suggestion').accept()<cr>", "Accept" },
  n = { ":lua require('copilot.suggestion').next()<cr>", "Next" },
  N = { ":lua require('copilot.suggestion').prev()<cr>", "Prev" },
  d = { ":lua require('copilot.suggestion').dismiss()<cr>", "Dismiss" },
  t = { ":lua require('copilot.suggestion').toggle_auto_trigger()<cr>", "Toggle Auto Trigger" },
}

wk.mappings['x'] = { ":xa<cr>", "Save All and Quit", }

wk.mappings["t"] = {
  name = ' Telescope',
  p = { ':Telescope projects<cr>', 'Projects' }, -- requires telescope-project.nvim plugin
  r = { ':Telescope resume<cr>', 'Resume' },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["k"] = { "<cmd>Telescope buffers<CR>", "Search Buffers" }
lvim.builtin.which_key.mappings["g"] = { "<cmd>Telescope grep_string<CR>", "Grep in dir" }

wk.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}