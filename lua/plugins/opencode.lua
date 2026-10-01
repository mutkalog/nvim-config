return {
    "nickjvandyke/opencode.nvim",
    -- Defaults to "main", supporting OpenCode v2.
    -- Uncomment to pull the latest stable release, supporting OpenCode v1.
    -- version = "*",
    config = function()
        ---@type opencode.Opts

        -- Add those env vars to shell rc file:
        -- export OPENCODE_SERVER_USERNAME=opencode
        -- export OPENCODE_SERVER_PASSWORD="$(opencode service get password)"
        -- Check opencode URL with: opencode service status
        vim.g.opencode_opts = {
            server = {
                url = "http://127.0.0.1:13420"
            },
        }
    -- Recommended/example keymaps
    vim.keymap.set({ "n", "x" }, "<C-a>",   function() require("opencode").ask("@this: ") end,                    { desc = "Ask OpenCode…" })
    vim.keymap.set({ "n", "x" }, "<C-x>",   function() require("opencode").select() end,                          { desc = "Select OpenCode…" })
    vim.keymap.set({ "n", "x" }, "go",      function() return require("opencode").operator("@this") end,         { desc = "Send range to OpenCode", expr = true })
    vim.keymap.set({ "n" },      "goo",     function() return require("opencode").operator("@this") .. "_" end,  { desc = "Send line to OpenCode", expr = true })
  end,
}
