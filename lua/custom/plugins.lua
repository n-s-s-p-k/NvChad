local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    -- {
    --   ensure_installed = {
    --     -- defaults 
    --     "vim",
    --     "lua",
    --
    --     -- web dev 
    --     "html",
    --     "css",
    --     "javascript",
    --     "typescript",
    --     "tsx",
    --     "json",
    --     -- "vue", "svelte",
    --
    --    -- low level
    --     "c",
    --     "zig"
    --   },
    -- },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- harpoon for file navigations and marking 
  {
    "ThePrimeagen/harpoon",
    cmd = "Harpoon",
  },

  -- project management
  {
    "charludo/projectmgr.nvim",
    lazy = false, -- important!
    config = function()
        require("projectmgr").setup({
        -- for syncing the project
            -- autogit = {
            --     enabled = true,
            --     command = "git pull --ff-only > .git/fastforward.log 2>&1",
            -- },
            session = { enabled = true, file = ".git/Session.vim" },
        })
    end,
  },

  -- for golang 
  -- generate the boiler plate go code 
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  -- codeium the AI 
    {
      "hrsh7th/nvim-cmp",
      config = function(_, opts)
          table.insert(opts.sources, { name = "codeium" })
          require("cmp").setup(opts)
      end,
      dependencies = {
          {
              "jcdickinson/codeium.nvim",
              config = function()
                  require("codeium").setup({})
              end,
          },
      },
  },

  -- diff view and much more in git 

{
  "lewis6991/gitsigns.nvim",
  dependencies = {
    {
      "sindrets/diffview.nvim",
      config = true,
    },
  }
},

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
