return {
    {
        'numToStr/Comment.nvim',
        lazy = false,
        opts = {
            -- Тoggler для одной строки и блочного комментирования
            toggler = {
                line = '<C-_>',   -- Ctrl+/ в терминале обычно воспринимается как Ctrl+_
                block = '<C-\\>', -- альтернативно для блочного комментария
            },
            -- Определяем операторные бинды (для визуального режима)
            opleader = {
                line = '<C-_>',
                block = '<C-\\>',
            },
            -- Дополнительно
            padding = true, -- пробел после // или #
            sticky = true,  -- курсор не прыгнет после комментирования
            ignore = nil,   -- можно игнорировать пустые строки
        },
        config = function(_, opts)
            require('Comment').setup(opts)
            -- Визуальный режим: Ctrl+/ для выделенного блока
            vim.keymap.set('v', '<C-_>', '<Plug>(comment_toggle_linewise_visual)', { noremap = false, silent = true })
        end,
    }
}
