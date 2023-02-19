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
		use{
			"lukas-reineke/indent-blankline.nvim",
			config = function()
			require("indent_blankline").setup {
			    show_current_context = true,
			    show_current_context_start = true,
			}
			end

		} 
		use {
		  'nvim-lualine/lualine.nvim',
		  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		  config = function()
				require("plugins.line")
		  end
		}
		use{
			'andweeb/presence.nvim',
			config = function()
				require("plugins.discord")
			end
		}
end)

