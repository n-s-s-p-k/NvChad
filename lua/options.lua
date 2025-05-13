require "nvchad.options"

-- add yours here!

local opt = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
