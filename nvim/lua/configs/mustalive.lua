-- Basic editor settings
vim.opt.number = true
vim.opt.relativenumber = true    

vim.opt.autoindent = false
vim.opt.smartindent = false

vim.opt.tabstop = 4              
vim.opt.softtabstop = 4          
vim.opt.shiftwidth = 4           
vim.opt.expandtab = true         
vim.opt.smarttab = true 

-- Essential usability settings
vim.opt.mouse = 'a'              
vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true     
vim.opt.hlsearch = true          
vim.opt.incsearch = true         
vim.opt.ignorecase = true        
vim.opt.smartcase = true         
vim.opt.wrap = false             
vim.opt.scrolloff = 8            
vim.opt.signcolumn = 'yes'       
vim.opt.updatetime = 250         

-- Enable filetype detection and plugins
vim.filetype.pluginindent = true
vim.cmd('filetype plugin indent on')
