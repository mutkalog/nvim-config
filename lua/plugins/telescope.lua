return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    --tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {}) -- find buffers
      vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {}) -- find in current buffer

      vim.keymap.set("n", "<leader>gc", builtin.git_commits, {}) -- git commits
      vim.keymap.set("n", "<leader>gs", builtin.git_status, {}) -- git status

      require("telescope").load_extension("ui-select")
    end,
  },
}
