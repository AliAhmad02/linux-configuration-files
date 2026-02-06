return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "asm", "c", "lua", "vim", "vimdoc", "python", "rust", "cpp", "markdown", "markdown_inline" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
