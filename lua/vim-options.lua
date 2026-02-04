local opt = vim.opt

opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.termguicolors = true

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

vim.g.mapleader = " "

vim.opt.swapfile = false
opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<c-s>', ":w<return>")

vim.keymap.set('n', "<leader>n",  "<cmd> set nu! <CR>") -- set line numbers
vim.keymap.set('n', "<leader>rn",  "<cmd> set rnu! <CR>") -- relative numbers
vim.keymap.set('n', "<leader>b",  "<cmd> enew <CR>") -- new buffer

--vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 400
opt.undofile = true
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]
vim.keymap.set('n', "<esc><esc>",  ":noh<return>") -- clear highlighting


-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-------------------------------------- old but gold ------------------------------------------
--vim.keymap.set("n", "<F8>",":lua require('nvterm.terminal').toggle'vertical' <CR><CR> make run <CR>")

  vim.cmd([[
imap "<tab> ""<Left>
imap '<tab> ''<Left>
imap (<tab> ()<Left>
imap [<tab> []<Left>
imap <<tab> <><Left>
imap {<tab> {}<Left>
imap {<CR> {<CR>}<ESC>O
imap {;<CR> {<CR>};<ESC>O
imap /*<CR> /*<CR>*/<ESC>O

""let g:yankring_clipboard_monitor=0
""map <F4> :1000cp<Cr>zvzz:cc<Cr>
"" Перейти к предыдущей ошибке.
"map <F5> :cp<Cr>zvzz:cc<Cr>
"" Перейти к следующей ошибке.
"map <F6> :cn<Cr>zvzz:cc<Cr>
" Сохранить все файлы и собрать проект (цель all в Makefile).
map <F7> :wall \| make all<Cr>
" Запустить проект (цель run в Makefile). 
map <F8> :make run<Cr>
]])
