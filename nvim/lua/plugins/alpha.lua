local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = {
		[[	███████████            ███                      █████               █████                               ]],
  	    [[	█░░░░░░░███            ░░░                      ░░███               ░░███                               ]],
        [[	      ███░    ██████   ████  ████████            ░███   ██████    ███████   ██████   ██████  ████████   ]],
        [[	     ███     ░░░░░███ ░░███ ░░███░░███           ░███  ░░░░░███  ███░░███  ███░░███ ███░░███░░███░░███  ]],
        [[	    ███       ███████  ░███  ░███ ░███           ░███   ███████ ░███ ░███ ░███ ░███░███ ░███ ░███ ░███  ]],
        [[	  ████     █ ███░░███  ░███  ░███ ░███     ███   ░███  ███░░███ ░███ ░███ ░███ ░███░███ ░███ ░███ ░███  ]],
	    [[	 ███████████░░████████ █████ ████ █████   ░░████████  ░░████████░░████████░░██████ ░░██████  ████ █████ ]],
		[[	░░░░░░░░░░░  ░░░░░░░░ ░░░░░ ░░░░ ░░░░░     ░░░░░░░░    ░░░░░░░░  ░░░░░░░░  ░░░░░░   ░░░░░░  ░░░░ ░░░░░  ]],
		[[                                                                                                          ]],
    	[[ 			    				 λ The Antithesis to the Chruch of Emacs λ				    			    ]],
}

dashboard.section.buttons.val = {
    		        dashboard.button("f", "  Find file", ":Telescope find_files hidden=true no_ignore=true<CR>"),
    		        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    		        dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
    		        dashboard.button("u", "  Update plugins", ":Lazy sync<CR>"),
    		        dashboard.button("r", "  Recently opened files", "<cmd>Telescope oldfiles<CR>"),
    		        dashboard.button("q", "  Quit", ":qa<CR>"),
    		    }

local handle = io.popen('fortune')
local fortune = handle:read("*a")
handle:close()
dashboard.section.footer.val = fortune
alpha.setup(dashboard.opts)

