return {
	"catppuccin/nvim",
	--  opts = {
	--    transparent_background = true,
	--  },
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
			background = "frappe",
		})
		vim.cmd([[colorscheme catppuccin]])
	end,
}
