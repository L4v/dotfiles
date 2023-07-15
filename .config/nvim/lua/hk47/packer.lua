-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- use {
	-- 	'VonHeikemen/lsp-zero.nvim',
	-- 	requires = {
	-- 		-- LSP Support
	-- 		{'neovim/nvim-lspconfig'},
	-- 		{'williamboman/mason.nvim'},
	-- 		{'williamboman/mason-lspconfig.nvim'},
	-- 		-- Autocompletion
	-- 		{'hrsh7th/nvim-cmp'},
	-- 		{'hrsh7th/cmp-buffer'},
	-- 		{'hrsh7th/cmp-path'},
	-- 		{'hrsh7th/cmp-nvim-lsp'},
	-- 		{'hrsh7th/cmp-nvim-lua'},
	-- 		{'hrsh7th/cmp-nvim-lsp-signature-help'},
	-- 		{'hrsh7th/vim-vsnip'},
	-- 		{'hrsh7th/cmp-vsnip'},
	-- 	}
	-- }

	-- LSP Support
	use {'neovim/nvim-lspconfig'}
	use {'williamboman/mason.nvim'}
	use {'williamboman/mason-lspconfig.nvim'}
	-- Autocompletion
	use {'hrsh7th/nvim-cmp'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/cmp-nvim-lua'}
	use {'hrsh7th/cmp-nvim-lsp-signature-help'}
	use {'hrsh7th/vim-vsnip'}
	use {'hrsh7th/cmp-vsnip'}

	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	use {
	    "jose-elias-alvarez/null-ls.nvim",
	    config = function()
		require("null-ls").setup()
	    end,
	    requires = { "nvim-lua/plenary.nvim" },
	}
	use 'jay-babu/mason-null-ls.nvim'

	use "lewis6991/hover.nvim"
	use {
	  "smjonas/inc-rename.nvim",
	  config = function()
	    require("inc_rename").setup()
	  end,
	}
end)
