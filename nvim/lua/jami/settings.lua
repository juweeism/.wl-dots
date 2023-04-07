-- 
-- check if option is global buffer or window
-- :h <option> 
--

local o = vim.o -- globals
local wo = vim.wo -- buffer
local bo = vim.bo -- window
local opt = vim.opt

o.pumheight = 5
o.termguicolors = true
o.scrolloff = 8
o.sidescrolloff = 8
o.showtabline = 2
o.guitablabel= "%N %t %M" 
o.hidden = true -- hides modified buffer 
o.confirm = true -- confirm before close buffer

opt.fillchars = {fold = " ", vert = " ", eob = " "}
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

wo.number = true
wo.relativenumber = true
wo.numberwidth = 4 
wo.wrap = false
wo.cursorline = true
wo.signcolumn = 'yes:1'

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true
o.autoindent = true
o.smartindent = true
