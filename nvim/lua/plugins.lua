require("packer").startup(function(use)
		use "wbthomason/packer.nvim"

		use "nvim-tree/nvim-web-devicons"
		use {
			"windwp/nvim-autopairs",
		    config = function() require("nvim-autopairs").setup {} end
		}
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }

		use {
		  'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		  requires = { {'nvim-lua/plenary.nvim'} }
		}


		-- use({
		--     'rose-pine/neovim',
		--     as = 'rose-pine',
		--     config = function()
		--         require("rose-pine").setup()
		--         vim.cmd('colorscheme rose-pine')
		--     end
		-- })

		use{
			'ellisonleao/gruvbox.nvim',
			 config = function()
				require("plugins.gruvbox")
		    	end}

		use {
		    'goolord/alpha-nvim',
		    requires = { 'nvim-tree/nvim-web-devicons' },
			config = function ()
				require("plugins.alpha")
			end}

		--     use {
		--       'nvim-tree/nvim-tree.lua',
		--       requires = {
		--         'nvim-tree/nvim-web-devicons', 
		--       },
		--       tag = 'nightly',
		--       config = function()
		--     	require("nvim-tree").setup()	 
		--       end
		--     }		
		use {
		  'nvim-tree/nvim-tree.lua',
		  requires = {
		    'nvim-tree/nvim-web-devicons', -- optional, for file icons
		  },
		  tag = 'nightly',
		  config = function()
			require("nvim-tree").setup()
		  end
		}	

end)

