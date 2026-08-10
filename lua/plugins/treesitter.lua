return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        opts = {
            ensure_installed = { "lua", "python", "matlab", "bash", "cmake", "vim", "cpp", "vimdoc", "c" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },

        config = function(_, opts)
            require('nvim-treesitter').install(opts.ensure_installed)
            require('nvim-treesitter').setup(opts)
        end,
    }
}
