return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {
            ensure_installed = { "clangd", "clang-format", "codelldb", "pyright",
                "mypy", "ruff", "black", "cmake",
                "bashls",
            }
        },
        config = function(_, opts)
            require("mason").setup(opts)
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            automatic_installation = true,
            automatic_enable = false,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.clangd.setup {
                --capabilities = capabilities,
                cmd = {"clangd", "--background-index", "--clang-tidy"},
                filetypes = { "cpp", "c" },
            }
            lspconfig.pyright.setup {
                capabilities = capabilities,
                filetypes = { "python" },
            }
            lspconfig.cmake.setup {
                capabilities = capabilities,
                filetypes = { "cmake" },
            }
            lspconfig.bashls.setup {
                capabilities = capabilities,
                filetypes = { "sh" },
            }


            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
        end,
    },
    --  {
    --    "jose-elias-alvarez/null-ls.nvim",
    --    event = "VeryLazy",
    --    opts = function()
    --      sources = {
    --        require("null-ls").builtins.formatting.clang_format,
    --        require("null-ls").builtins.formatting.black,
    --        require("null-ls").builtins.diagnostics.mypy,
    --        require("null-ls").builtins.diagnostics.ruff,
    --      }
    --    end,
    --  },

}
