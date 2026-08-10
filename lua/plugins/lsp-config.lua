return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
        },
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "pyright",
                "json-lsp",
                "lua-language-server",
                "neocmakelsp",
                "bash-language-server",
                "matlab-language-server",
            },
        },
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

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })

            vim.lsp.config("clangd", {
                cmd = { "clangd", "--background-index", "--clang-tidy" },
            })

            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })

            vim.lsp.config("jsonls", {
                capabilities = capabilities,
            })

            vim.lsp.config("neocmake", {
                capabilities = capabilities,
            })

            vim.lsp.config("bashls", {
                capabilities = capabilities,
            })

            vim.lsp.config("matlab_ls", {
                capabilities = capabilities,
            })

            vim.lsp.enable("jsonls")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("clangd")
            vim.lsp.enable("pyright")
            vim.lsp.enable("neocmake")
            vim.lsp.enable("bashls")
            vim.lsp.enable("matlab_ls")

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "List information about the symbol under cursor" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to the definition" })
            vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "List document symbols" })
            vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, { desc = "List all references of the symbol under cursor" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "List code actions" })
            vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format file" })
            vim.keymap.set("v", "<leader>fm", vim.lsp.buf.format, { desc = "Format selection" })
            vim.keymap.set("n", "<leader>ic", vim.lsp.buf.incoming_calls, { desc = "List all the call sites of the symbol under cursor" })
            vim.keymap.set("n", "<leader>rs", vim.lsp.buf.rename, { desc = "Rename the symbol under cursor" })
            vim.keymap.set("n", "<leader>ch", ":LspClangdSwitchSourceHeader<CR>", { desc = "Switch between source and header" })
        end,
    }
}
