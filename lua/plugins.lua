return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.2', cmd = 'Telescope', keys = {'<leader>ff', '<leader>fg', '<leader>fb', '<leader>fh'},
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup{
        defaults = {
          mappings = {
            i = {
              ["<ESC>"] = require("telescope.actions").close
            },
          },
        }
      }    
    end
  },
  {
    "onsails/lspkind.nvim", event = 'VeryLazy',
    config = function()
      local lspkind = require("lspkind")
	lspkind.init({
  	symbol_map = {
    	  Copilot = "",
  	},
      })
      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = {'BufRead', 'BufEnter', 'TextChanged', 'BufWinEnter', 'VimResized'},
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "folke/trouble.nvim",
    event = 'VeryLazy',
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'nvim-lualine/lualine.nvim', event = 'VeryLazy',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('lualine').setup()
    end
  },
  {
    'akinsho/toggleterm.nvim', cmd = 'ToggleTerm', keys = {'<leader>tt', '<leader>tf'},
    version = "*", config = true,
    config = function()
      require("toggleterm").setup{
        open_mapping = [[<leader>tt]]
      }
    end
  },
  {
    'norcalli/nvim-colorizer.lua', ft = {'html', 'css', 'scss', 'pov', 'inc'},
    config = function()
      require'colorizer'.setup()
    end
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end, 
  },
  {
    "zbirenbaum/copilot-cmp",
    event = {'InsertEnter', 'cmdlineEnter'},
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  {
	"hrsh7th/nvim-cmp",
  event = {'InsertEnter', 'cmdlineEnter'},
	  dependencies = {
		  "hrsh7th/cmp-nvim-lsp",
		  "hrsh7th/cmp-nvim-lua",
		  "hrsh7th/cmp-buffer",
	  	"hrsh7th/cmp-path",
	  	"hrsh7th/cmp-cmdline",
		  "saadparwaiz1/cmp_luasnip",
		  "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-emoji",
      "kdheepak/cmp-latex-symbols",
      
      "hrsh7th/cmp-nvim-lsp"
	  },
    config = function()
      local cmp = require("cmp")
	  vim.opt.completeopt = { "menu", "menuone", "noselect" }

	  cmp.setup({
		  snippet = {
			  expand = function(args)
				  require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			  end,
		  },
		  window = {
			  -- completion = cmp.config.window.bordered(),
			  -- documentation = cmp.config.window.bordered(),
		  },
		  mapping = cmp.mapping.preset.insert({
			  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
			  ["<C-f>"] = cmp.mapping.scroll_docs(4),
			  ["<C-Space>"] = cmp.mapping.complete(),
			  ["<C-n>"] = cmp.mapping.abort(),
			  ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		  }),
		  sources = cmp.config.sources({
        { name = "copilot", group_index = 2 },
			  { name = "nvim_lsp" },
			  { name = "nvim_lua" },
			  { name = "luasnip" }, -- For luasnip users.
			  -- { name = "orgmode" },
        {
          name = "latex_symbols",
          option = {
            strategy = 0, -- mixed
          },
        },
		  }, {
			  { name = "buffer" },
			  { name = "path" },
		  }),
	  })

    cmp.setup.cmdline(":", {
		  mapping = cmp.mapping.preset.cmdline(),
		  sources = cmp.config.sources({
			  { name = "path" },
		  }, {
			  { name = "cmdline" },
		  }),
	  })
  end
  },
  { 'simeji/winresizer', keys = {'<C-e>'}},
  {
  "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>ft","<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
      require("neo-tree").setup()
    end,
  },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
        require'window-picker'.setup()
    end,
  },
}
