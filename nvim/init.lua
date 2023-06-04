require("jami")

vim.cmd([[
  augroup Welcome
    autocmd!
    autocmd VimEnter * :Limelight!!
  augroup END
]])
