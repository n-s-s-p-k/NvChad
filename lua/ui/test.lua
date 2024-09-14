---@class MappingsTable
local M = {}

M.base46 = {
  hl_override = {
    Pmenu = { bg = "white" },
    -- Pmenu = { bg = "#ffffff" }, this works too

    -- if you want to lighten or darken color
    -- this will use the black color from nvchad theme & lighten it by 2x
    -- use a negative number to darken it
    Normal = {
      bg = { "black", 2 },
    },

    MyHighlightGroup = { -- custom highlights are also allowed
      fg = "red",
      bg = "darker_black",
    },
  },
}
