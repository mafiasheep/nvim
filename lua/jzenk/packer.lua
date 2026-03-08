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

    use 'tpope/vim-fugitive'
	use 'theprimeagen/harpoon'

    use {
        "saghen/blink.cmp",
        tag = "*",
        requires = { "rafamadriz/friendly-snippets" }
    }

    use {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    }

    use {
        "neovim/nvim-lspconfig",
        requires = "saghen/blink.cmp",
    }

    use {
        "m4xshen/autoclose.nvim",
        config = function()
            require("autoclose").setup()
        end,
    }
end)


