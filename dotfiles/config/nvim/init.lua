-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic Options
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.termguicolors = true

-- Setup Lazy
require("lazy").setup({
  -- UI & Theme
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- File Explorer (Neo-tree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- Requires a Nerd Font
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          width = 30,
        },
        filesystem = {
          filtered_items = {
            visible = true, -- Show hidden files by default
          },
        },
      })
      vim.keymap.set('n', '<leader>e', ':Neotree toggle left<CR>', { desc = '[E]xplorer toggle' })
    end
  },

  -- Finder (Telescope)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind [G]rep' })
      vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    end
  },

  -- Syntax Highlight (Treesitter)
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "tsx", "go", "python", "rust", "html", "css", "json" },
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },

  -- Git
  { 'lewis6991/gitsigns.nvim', opts = {} },

  -- Auto Completion & LSP would go here (Simplified for brevity)
  {
      'neovim/nvim-lspconfig',
      dependencies = {
          'williamboman/mason.nvim',
          'williamboman/mason-lspconfig.nvim',
      },
      config = function()
          require("mason").setup()
          require("mason-lspconfig").setup({
              ensure_installed = { "lua_ls", "ts_ls", "pyright", "gopls" },
          })
          local lspconfig = require('lspconfig')
          lspconfig.lua_ls.setup {}
          lspconfig.ts_ls.setup {}
          lspconfig.pyright.setup {}
          lspconfig.gopls.setup {}
      end
  }
})
