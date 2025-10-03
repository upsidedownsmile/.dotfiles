return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use { "ellisonleao/gruvbox.nvim" }

    use({ "ssh://git.amazon.com:2222/pkg/Vim-code-browse", branch = 'mainline' })

    use('christoomey/vim-tmux-navigator')

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }

    -- use({
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v3.x",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    --         "MunifTanjim/nui.nvim",
    --         -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    --     }
    -- })

    use('j-hui/fidget.nvim')

    use ('neovim/nvim-lspconfig')

    use ("ntpeters/vim-better-whitespace")

    use ("terrortylor/nvim-comment")

    -- lsp
    use ('hrsh7th/nvim-cmp')

    use('hrsh7th/cmp-nvim-lsp')
    use ('mfussenegger/nvim-jdtls')

    use {"windwp/nvim-autopairs"}
    use ("ray-x/lsp_signature.nvim")
    use {'dgagn/diagflow.nvim'}
end)
