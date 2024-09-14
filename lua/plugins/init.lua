return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        -- web
        "html",
        "css",
        "javascript",
        -- script
        "python",
        "cpp",
        "bash",
        "json",
        -- work
        "yaml",
        "go",
        "ruby",
        "puppet",
        "markdown",
        "terraform",
      },
    },
  },

  -- harpoon for file navigations and marking
  {
    "ThePrimeagen/harpoon",
    config = function()
      -- the setup
    end,
  },

  -- Copilot
  {
    "github/copilot.vim",
    lazy = false,
    config = function() -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
    end,
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- hop for better navigations
  {
    "smoka7/hop.nvim",
    opts = {
      multiwindow = true,
      keys = "etovxqpdygfblzhckisuran",
      uppercase_labels = true,
    },
  },

  -- Better git support
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = function()
      require("neogit").setup {}
    end,
  },

  -- -- highlight colors
  -- {
  --   "echasnovski/mini.hipatterns",
  --   event = "BufReadPre",
  --   config = function()
  --     require("configs.hipatterns").setup {}
  --   end,
  -- },
  -- alternative to the above
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- Refactoring tool
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>rf",
        function()
          require("refactoring").select_refactor {
            show_success_message = true,
          }
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },

  -- testing using the neotest for neovim
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require "lua.configs.neotest_config"
    end,
  },
  --
  --   -- override plugin configs
  -- {
  --   "williamboman/mason.nvim",
  --   opts = require "configs.mason",
  -- },
  -- {
  --   M.mason.pkgs = {
  --     "delve"
  --   }
  -- }
}
