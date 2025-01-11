local options = {
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 1,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    fileencoding = "utf-8",                  -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    showtabline = 3,                         -- always show tabs
    smartindent = true,                      -- make indenting smarter again
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeoutlen = 750,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    updatetime = 200,                        -- faster completion (4000ms default)
	expandtab = true,						 -- use space instead of tabs
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    tabstop = 4,							 -- the number of spaces that a <Tab> in the files counts for
	softtabstop = 4,						 -- set backspace over tabs to delete in multiples of 4 spaces 
    number = true,                           -- set numbered lines
    relativenumber = true,                   -- set relative numbered lines
    numberwidth = 2,                         -- set number column width to 2 {default 4}
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    wrap = false,                            -- display lines as one long line
    scrolloff = 8,                           -- is one of my fav
    sidescrolloff = 8,
    guifont = "caskaydiacove NF:h17",        -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"
vim.g.mapleader = " "

for k, v in pairs(options) do
    vim.opt[k] = v
end
