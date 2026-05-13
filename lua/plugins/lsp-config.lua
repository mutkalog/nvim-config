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
                cmd = { "clangd", "--background-index", "--clang-tidy" },
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


            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "List information about the symbol under cursor" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to the definition" })
            vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "List document symbols" })
            vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, { desc = "List all references of the symbol under cursor" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "List code actions" })
            vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format file" })
            vim.keymap.set("v", "<leader>fm", vim.lsp.buf.format, { desc = "Format selection" })
            vim.keymap.set("n", "<leader>ic", vim.lsp.buf.incoming_calls, { desc = "List all the call sites of the symbol under cursor" })
            vim.keymap.set("n", "<leader>rs", vim.lsp.buf.rename, { desc = "Rename the symbol under cursor" })
            vim.keymap.set("n",  "<leader>ch", ":ClangdSwitchSourceHeader<CR>", { desc = "Switch between source and header" })
        end,
    }
}
