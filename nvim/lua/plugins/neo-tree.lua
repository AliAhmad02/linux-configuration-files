return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    window = {
      position = "float",

      mappings = {
        ["o"] = "system_open",
      },
    },

    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        -- Linux: open file in default application
        vim.fn.jobstart({ "xdg-open", path }, { detach = true })
      end,
    },
  },

  keys = {
    { "<leader>tr", ":Neotree filesystem reveal<CR>" },
  },

  filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  }
}
