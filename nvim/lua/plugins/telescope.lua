local builtin = require("telescope.builtin")

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- or                              , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", builtin.find_files },
      { "<leader>fg", builtin.live_grep },
      { "<leader>fb", builtin.buffers,   { desc = "Telescope buffers" } },
    },
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- This is your opts table
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })

      require("telescope").load_extension("ui-select")
    end,
  },
}
