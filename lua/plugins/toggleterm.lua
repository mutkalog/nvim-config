return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>")
            vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=vertical<CR>")
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])

            require("toggleterm").setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return vim.api.nvim_win_get_height(0) * 0.7
                    elseif term.direction == "vertical" then
                        return vim.api.nvim_win_get_width(0) * 0.7
                    end
                end,
                hide_numbers = true,
            })
        end
    },
}
