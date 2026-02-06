return {
	"quarto-dev/quarto-nvim",
	opts = {
		lspFeatures = {
			enabled = true,
			chunks = "curly",
			languages = { "r", "python", "julia", "bash", "html" },
			diagnostics = {
				enabled = true,
				triggers = { "BufWritePost" },
			},
			completion = {
				enabled = true,
			},
		},
	},
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
