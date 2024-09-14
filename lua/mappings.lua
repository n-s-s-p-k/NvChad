-- Load NvChad mappings
require "nvchad.mappings"

-- Helper function for mapping
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- General mappings
map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Buffer operations
map("n", "<leader>X", ":bufdo bd<CR>", { desc = "Close all buffers" })
map("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })
map("n", "<leader>bf", ":bfirst<CR>", { desc = "First buffer" })
map("n", "<leader>bl", ":blast<CR>", { desc = "Last buffer" })
map("n", "<leader>bh", ":Buffers<CR>", { desc = "List buffers" }) -- Requires fzf or similar plugin

-- Harpoon mappings
local harpoon = require "harpoon"
local harpoon_ui = require "harpoon.ui"
local harpoon_mark = require "harpoon.mark"
local harpoon_term = require "harpoon.term"

map("n", "<C-e>a", harpoon_mark.add_file, { desc = "Harpoon: Add file" })
map("n", "<C-e>l", harpoon_ui.toggle_quick_menu, { desc = "Harpoon: Toggle quick menu" })
map("n", "<C-e>p", harpoon_ui.nav_prev, { desc = "Harpoon: Navigate to previous mark" })
map("n", "<C-e>n", harpoon_ui.nav_next, { desc = "Harpoon: Navigate to next mark" })

for i = 1, 4 do
  map("n", string.format("<leader>%s", i), function()
    harpoon_ui.nav_file(i)
  end, { desc = string.format("Harpoon: Navigate to file %s", i) })
end

map("n", "<leader>tt", function()
  harpoon_term.gotoTerminal(1)
end, { desc = "Harpoon: Go to terminal 1" })
map("n", "<leader>tc", function()
  harpoon_term.sendCommand(1, "ls -la")
end, { desc = "Harpoon: Send 'ls -la' to terminal 1" })

-- Copilot mappings
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

map("i", "<C-j>", 'copilot#Accept("<CR>")', {
  expr = true,
  replace_keycodes = false,
  desc = "Copilot: Accept suggestion",
})
map("i", "<C-]>", "<Plug>(copilot-dismiss)", { desc = "Copilot: Dismiss suggestion" })
map("i", "<M-]>", "<Plug>(copilot-next)", { desc = "Copilot: Next suggestion" })
map("i", "<M-[>", "<Plug>(copilot-previous)", { desc = "Copilot: Previous suggestion" })
map("i", "<M-\\>", "<Plug>(copilot-suggest)", { desc = "Copilot: Request suggestion" })
map("i", "<M-Right>", "<Plug>(copilot-accept-word)", { desc = "Copilot: Accept word" })
map("i", "<M-C-Right>", "<Plug>(copilot-accept-line)", { desc = "Copilot: Accept line" })
map("i", "<C-l>", "<Plug>(copilot-accept-word)", { desc = "Copilot: Accept word (alternative)" })

-- Set up highlight group for Copilot suggestions
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "CopilotSuggestion", {
      fg = "#555555",
      ctermfg = 8,
      force = true,
    })
  end,
})

-- Hop plugin mapping
local hop = require "hop"
map({ "n", "x", "o", "v" }, "<leader>fj", function()
  hop.hint_words()
end, { desc = "Hop: Hint words" })

-- Markdown Preview mappings
map("n", "<leader>mp", "<Plug>MarkdownPreview", { silent = true, noremap = true, desc = "Markdown: Start preview" })
map("n", "<leader>ms", "<Plug>MarkdownPreviewStop", { desc = "Markdown: Stop preview" })
map("n", "<leader>mt", "<Plug>MarkdownPreviewToggle", { desc = "Markdown: Toggle preview" })

-- Markdown Preview settings optimized for macOS
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_command_for_global = 0
vim.g.mkdp_open_to_the_world = 0
vim.g.mkdp_open_ip = ""
vim.g.mkdp_browser = "google" -- Use Safari as the default browser on macOS
vim.g.mkdp_echo_preview_url = 1 -- Echo preview page URL in command line
vim.g.mkdp_browserfunc = "google"
vim.g.mkdp_preview_options = {
  mkit = {},
  katex = {},
  uml = {},
  maid = {},
  disable_sync_scroll = 0,
  sync_scroll_type = "middle",
  hide_yaml_meta = 1,
  sequence_diagrams = {},
  flowchart_diagrams = {},
  content_editable = false,
  disable_filename = 0,
}
vim.g.mkdp_markdown_css = ""
vim.g.mkdp_highlight_css = ""
vim.g.mkdp_port = ""
vim.g.mkdp_page_title = "「${name}」"
vim.g.mkdp_filetypes = { "markdown" }
vim.g.mkdp_theme = "dark"

-- Function to open preview in default macOS browser
vim.g.mkdp_browserfunc = "OpenMarkdownPreview"

-- Define the function to open preview in default browser
vim.cmd [[
function! OpenMarkdownPreview(url)
    execute "silent ! open " . a:url
endfunction
]]
