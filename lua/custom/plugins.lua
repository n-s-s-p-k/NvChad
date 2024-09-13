local overrides = require "custom.configs.overrides"

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
      require("projectmgr").setup {
        -- for syncing the project
        -- autogit = {
        --     enabled = true,
        --     command = "git pull --ff-only > .git/fastforward.log 2>&1",
        -- },
        session = { enabled = true, file = ".git/Session.vim" },
      }
    end,
  },

  -- for golang
  -- generate the boiler plate go code
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings "gopher"
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  -- -- codeium the AI
  -- {
  --   "hrsh7th/nvim-cmp",
  --   config = function(_, opts)
  --     table.insert(opts.sources, { name = "codeium" })
  --     require("cmp").setup(opts)
  --   end,
  --   dependencies = {
  --     {
  --       "jcdickinson/codeium.nvim",
  --       config = function()
  --         require("codeium").setup {}
  --       end,
  --     },
  --   },
  -- },

  -- github copilot
  {
    "github/copilot.vim",
    lazy = false,
    config = function() -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end,
  },

  -- diff view and much more in git
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      {
        "sindrets/diffview.nvim",
        config = true,
      },
    },
  },

  -- {
  --   "mfussenegger/nvim-dap",
  -- },
  --
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "suketa/nvim-dap-ruby",
    },
    config = function()
      require("dap-ruby").setup()
    end,
  },
  {
    "nvim-neotest/nvim-nio",
  },
  -- nvim dap for debugging
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap",
    },
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings "dap_go"
    end,
  },

  -- {
  --   "leoluz/nvim-dap-go",
  --   ft = "go",
  --   dependencies = {
  --     "rcarriga/nvim-dap-ui",
  --     -- "mfussenegger/nvim-dap",
  --   },
  -- },

  -- dap ui
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      -- Note: Added this <leader>dd duplicate of <F5> because somehow the <F5>
      -- mapping keeps getting reset each time I restart nvim-dap. Annoying but whatever.
      --
      -- vim.keymap.set("n", "<leader>dd", function()
      --   require("dapui").open() -- Requires nvim-dap-ui
      --
      --   vim.cmd [[DapContinue]] -- Important: This will lazy-load nvim-dap
      -- end)

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    lazy = false,
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_theme = "dark"
    end,
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
