return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "godlygeek/tabular",
    lazy = false, -- Normally not a good idea - but Tabularize is used everywhere
  },

  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = { },
  },

  {
    "ibhagwan/fzf-lua",
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  },

  {
    "nvim-neorg/neorg", -- install locally just to make sure : luarocks install neorg --local
    dependencies = { "luarocks.nvim" },
    lazy = false, -- Disable lazy loading
    version = "*", -- Pin Neorg to the latest stable release
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.looking-glass"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond",
            folds = false,
          },
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Documents/VimWiki/neorg",
            },
            default_workspace = "notes",
          },
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "gopls",
        "pyright",
        "mypy",
        "ruff",
      },
    },
  },

  {
    "vimwiki/vimwiki",
    lazy = false, -- Normally not a good idea - but vimwiki is used everywhere
    init = function()
      vim.g.vimwiki_global_ext = 0
      vim.g.vimwiki_list = {
        {
          path = "~/Documents/VimWiki/tech.wiki/",
          syntax = "default",
          ext = ".wiki",
        },
        {
          path = "~/Code/Google/VimWiki/",
          syntax = "markdown",
          ext = ".md",
        },
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "terraform",
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "go",
        "python",
      },
    },
  },
  {
    "olexsmir/gopher.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("gopher").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
  },

  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    enabled = vim.fn.has "linux" == 1,
    config = function()
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
      vim.g.codeium_filetypes = {
        markdown = false,
        vimwiki = false,
        neorg = false,
      }
    end,
  },

  {
    "sbdchd/neoformat",
    event = "BufEnter",
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    lazy = false,
    --dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    overrides = {
      buftype = {
            vimwiki = { sign = { enabled = false } },
        },
    },
  },
  {
    "natecraddock/workspaces.nvim", -- config stored in ~/.local/share/<NVIM_APPNAME>/workspaces
    lazy = false, -- Disable lazy loading
    config = function()
      vim.keymap.set("n", "<leader>wo", "<cmd>lua require('workspaces').open()<CR>", { desc = "Open Workspace" })
      require("workspaces").setup {
        hooks = {
          open = { "Telescope find_files" },
        },
      }
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      dashboard = {
        enabled = true,
        example = "compact_files"
      },
    },
  }
}
