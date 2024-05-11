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
  },

  {
    "nvim-neorg/neorg", -- install locally just to make sure : luarocks install neorg --local
    dependencies = { "luarocks.nvim" },
    lazy = false, -- Disable lazy loading
    version = "*", -- Pin Neorg to the latest stable release
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = { config = { icon_preset = "diamond" } }, -- Adds pretty icons to your documents
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
    end,
  },

  {
    "sbdchd/neoformat",
    event = "BufEnter",
  },
}
