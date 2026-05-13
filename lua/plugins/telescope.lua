return {
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install'
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        --tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                    fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                },
            })
            -- To get fzf loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require('telescope').load_extension('fzf')
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            -- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
            --     additional_args = function()
            --         return { "--hidden" }
            --     end
            -- })
            vim.keymap.set("n", "<leader>fg", function()
                builtin.live_grep({
                    additional_args = function()
                        return { "--hidden" }
                    end
                })
            end)
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})                   -- find buffers
            vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {}) -- find in current buffer

            vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})               -- git commits
            vim.keymap.set("n", "<leader>gs", builtin.git_status, {})                -- git status
            -- vim.keymap.set("n", "<leader>fg", builtin.extensions.live_grep_args.live_grep_args, {})
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("live_grep_args")
        end,
    },
}
