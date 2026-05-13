return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        local highlight = {
            --"CursorColumn",
            "Whitespace",
        }
        require("ibl").setup {
            indent = { highlight = highlight, char = "|" },
            whitespace = {
                highlight = highlight,
                remove_blankline_trail = false,
            },
            scope = { enabled = true,
                show_exact_scope = false,
                show_start = false,
                show_end = false,
            },

        }
    end,
}
