require("packer").startup(function(use)
		use "wbthomason/packer.nvim"
		--use "nvim-lua/plenary.nvim"
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


		use({
		    'rose-pine/neovim',
		    as = 'rose-pine',
		    config = function()
		        require("rose-pine").setup()
		        vim.cmd('colorscheme rose-pine')
		    end
		})

		use {
		    'goolord/alpha-nvim',
		    requires = { 'nvim-tree/nvim-web-devicons' },

			config = function ()
    		    local alpha = require('alpha')
    		    local dashboard = require('alpha.themes.dashboard')
    		    dashboard.section.header.val = {
    		        [[                                                                       ]],
    		        [[  ██████   █████                   █████   █████  ███                  ]],
    		        [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
    		        [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
    		        [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
    		        [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
    		        [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
    		        [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
    		        [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
    		        [[                                                                       ]],
    		        [[                     λ it be like that sometimes λ                     ]],
    		    }

    		    dashboard.section.buttons.val = {
    		        dashboard.button("f", "  Find file", ":Telescope find_files hidden=true no_ignore=true<CR>"),
    		        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    		        dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
    		        dashboard.button("u", "  Update plugins", ":Lazy sync<CR>"),
    		        dashboard.button("r", "  Recently opened files", "<cmd>Telescope oldfiles<CR>"),
    		        dashboard.button("l", "  Open last session", "<cmd>RestoreSession<CR>"),
    		        dashboard.button("q", "  Quit", ":qa<CR>"),
    		    }

    		    local handle = io.popen('fortune')
    		    local fortune = handle:read("*a")
    		    handle:close()
    		    dashboard.section.footer.val = fortune
    		    alpha.setup(dashboard.opts)
				
			end	
		}
end)

