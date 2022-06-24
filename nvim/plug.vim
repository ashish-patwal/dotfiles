if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'tami5/lspsaga.nvim'
  " Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'onsails/lspkind-nvim'
  Plug 'iamcco/markdown-preview.nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'tpope/vim-commentary'
  Plug 'folke/zen-mode.nvim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  " Plug 'https://github.com/davisdude/vim-love-docs'
endif

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()

