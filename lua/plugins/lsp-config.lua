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
                "lua-language-server",
                "cmake-language-server",
                "bash-language-server",
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
                filetypes = { "c", "cpp" },
            })

            vim.lsp.config("pyright", {
                capabilities = capabilities,
                filetypes = { "python" },
            })

            vim.lsp.config("cmake", {
                capabilities = capabilities,
                filetypes = { "cmake" },
            })

            vim.lsp.config("bashls", {
                capabilities = capabilities,
                filetypes = { "sh" },
            })

            vim.lsp.enable("lua_ls")
            vim.lsp.enable("clangd")
            vim.lsp.enable("pyright")
            vim.lsp.enable("cmake")
            vim.lsp.enable("bashls")

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "List information about the symbol under cursor" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to the definition" })
            vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "List document symbols" })
            vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, { desc = "List all references of the symbol under cursor" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "List code actions" })
            vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format file" })
            vim.keymap.set("v", "<leader>fm", vim.lsp.buf.format, { desc = "Format selection" })
            vim.keymap.set("n", "<leader>ic", vim.lsp.buf.incoming_calls, { desc = "List all the call sites of the symbol under cursor" })
            vim.keymap.set("n", "<leader>rs", vim.lsp.buf.rename, { desc = "Rename the symbol under cursor" })
            vim.keymap.set("n", "<leader>ch", ":ClangdSwitchSourceHeader<CR>", { desc = "Switch between source and header" })
        end,
    }
}
