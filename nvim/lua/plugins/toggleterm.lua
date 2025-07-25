local trim_spaces=false
vim.keymap.set("v", "<space>ss", function()
    require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = vim.v.count })
end)
return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    open_mapping=[[<c-\>]],
    direction='float',
    float_opts={
      border='curved',
    }
  }
}
