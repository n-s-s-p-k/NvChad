---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

-- harpoon key bindings
M.harpoon = {
  n = {
    ["<leader>ha"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "󱡁 Harpoon Add file",
    },
    ["<leader>ta"] = { "<CMD>Telescope harpoon marks<CR>", "󱡀 Toggle quick menu" },
    ["<leader>hb"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "󱠿 Harpoon Menu",
    },
    ["<leader>1"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "󱪼 Navigate to file 1",
    },
    ["<leader>2"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "󱪽 Navigate to file 2",
    },
    ["<leader>3"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "󱪾 Navigate to file 3",
    },
    ["<leader>4"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "󱪿 Navigate to file 4",
    },
  },
}

-- project Manager
M.projects = {
  n = {
    ["<leader>fp"] = { "<cmd> ProjectMgr<CR>", "Open Projects" },
  },
}

-- binding for Markdown Preview
M.mdpreview = {
  n = {
    ["<leader>mp"] = { "<cmd> MarkdownPreview<CR>", "Open Preview" },
    ["<leader>mc"] = { "<cmd> MarkdownPreviewStop<CR>", "Close Preview" },
  },
}

-- nvimdap
M.nvimdap = {
  n = {
    ["<leader>db"] = { ":lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
    ["<leader>dc"] = { ":lua require'dap'.continue()<CR>", "Continue" },
    ["<leader>di"] = { ":lua require'dap'.step_into()<CR>", "Step Into" },
    ["<leader>do"] = { ":lua require'dap'.step_over()<CR>", "Step Over" },
    ["<leader>dO"] = { ":lua require'dap'.step_out()<CR>", "Step Out" },
    ["<leader>dr"] = { ":lua require'dap'.repl.open()<CR>", "Open REPL" },
    ["<leader>dl"] = { ":lua require'dap'.run_last()<CR>", "Run Last" },
  },
}

return M
