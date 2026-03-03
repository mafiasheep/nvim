-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '*',
		requires = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		}
	}
	use ({ 
		"catppuccin/nvim", 
		as = "catppuccin",
		config = function()
			vim.cmd('colorscheme catppuccin')
		end
	})
	use { 'folke/tokyonight.nvim', as = 'tokyonight' }
	use { 'rose-pine/nvim', as = 'rose-pine' }

	use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use ('theprimeagen/harpoon')	
	use ('mbbill/undotree')
    use ('neovim/nvim-lspconfig')
    use ('williamboman/mason.nvim')
    use ('williamboman/mason-lspconfig.nvim')

end)


