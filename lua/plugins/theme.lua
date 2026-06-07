return {
    {
        'talha-akram/noctis.nvim',
        priority = 1000,
    },
    {
        'everviolet/nvim',
        name = 'evergarden',
        priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
        opts = {
            theme = {
                variant = 'winter', -- 'winter'|'fall'|'spring'|'summer'
                accent = 'green',
            },
            editor = {
                transparent_background = false,
                sign = { color = 'none' },
                float = {
                    color = 'mantle',
                    solid_border = false,
                },
                completion = {
                    color = 'surface0',
                },
            },
        },
        config = function(_, opts)
            require('evergarden').setup(opts)
        end,
    },
    {
        "RRethy/base16-nvim",
    },
    {
        'datsfilipe/vesper.nvim',
        priority = 1000,
        opts = {
            transparent = false, -- Boolean: Sets the background to transparent
            italics = {
                comments = true, -- Boolean: Italicizes comments
                keywords = true, -- Boolean: Italicizes keywords
                functions = true, -- Boolean: Italicizes functions
                strings = true, -- Boolean: Italicizes strings
                variables = true, -- Boolean: Italicizes variables
            },
            overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
            palette_overrides = {}
        },
        config = function(_, opts)
            require('vesper').setup(opts)
        end,
    }
}
