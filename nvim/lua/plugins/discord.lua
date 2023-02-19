require("presence").setup({
    auto_update         = true,
    neovim_image_text   = "The Antithesis to the Church of Emacs", -- Text displayed when hovered over the Neovim image
    main_image          = "file",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,              
    debounce_timeout    = 10,
    enable_line_number  = false,
    blacklist           = {},
    buttons             = true,
    file_assets         = {},   
    show_time           = true,                       
    editing_text        = "Editing %s",             
    file_explorer_text  = "Browsing %s",            
    git_commit_text     = "Committing changes",       
    plugin_manager_text = "Managing plugins",         
    reading_text        = "Reading %s",               
    workspace_text      = "Working on %s",            
    line_number_text    = "Line %s out of %s",        
})
