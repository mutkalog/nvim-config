return {
  "cdelledonne/vim-cmake",

  config = function()
    vim.keymap.set("n", "<Leader>cgd", ":CMakeGenerate Debug<CR>")
    vim.keymap.set("n", "<Leader>cgr", ":CMakeGenerate Release<CR>")
    vim.keymap.set("n", "<Leader>cc", ":CMakeClean<CR>")
    vim.keymap.set("n", "<Leader>ct", ":CMakeToggle<CR>")
    vim.keymap.set("n", "<Leader>cb", ":CMakeBuild<CR>")
    vim.keymap.set("n", "<Leader>cr", ":CMakeRun app<CR>")

    vim.cmd([[
      let g:cmake_console_position = 'vertical'
      let g:cmake_console_size = 70
      let g:cmake_root_markers = ['.git', '.svn', 'CMakeLists.txt']
    ]])
  end,

}
