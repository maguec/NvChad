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
    lazy = false,       -- Normally not a good idea - but Tabularize is used everywhere
  },

  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",   -- install locally just to make sure : luarocks install neorg --local
    dependencies = { "luarocks.nvim" },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function ()
      require("neorg").setup({})
    end
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
   		},
   	},
   },

  {
 	"nvim-treesitter/nvim-treesitter",
 	opts = {
 		ensure_installed = {
 			  "vim", "lua", "vimdoc",
        "terraform",
        "html", "css", "go", "python"
 		},
 	},
 },

}
