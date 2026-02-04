return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "lua", "vim", "cpp", "vimdoc", "c" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },

    }
  }
}
