return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				-- Enable treesitter highlighting and disable regex syntax
				pcall(vim.treesitter.start)
				-- Enable treesitter-based indentation
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		local ensureInstalled = {
			"asm",
			"c",
			"lua",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"python",
			"rust",
			"cpp",
		}
		local alreadyInstalled = require("nvim-treesitter.config").get_installed()
		local parsersToInstall = vim.iter(ensureInstalled)
			:filter(function(parser)
				return not vim.tbl_contains(alreadyInstalled, parser)
			end)
			:totable()
		require("nvim-treesitter").install(parsersToInstall)
	end,
	--   "nvim-treesitter/nvim-treesitter",
	--   branch="main",
	-- 	build = function()
	-- 		require("nvim-treesitter.install").update({ with_sync = true })()
	-- 	end,
	-- 	config = function()
	-- 		local configs = require("nvim-treesitter.configs")
	--
	-- 		configs.setup({
	-- 			ensure_installed = {
	-- 				"asm",
	-- 				"c",
	-- 				"lua",
	-- 				"vim",
	-- 				"vimdoc",
	-- 				"python",
	-- 				"rust",
	-- 				"cpp",
	-- 				"markdown",
	-- 				"markdown_inline",
	-- 			},
	-- 			highlight = { enable = true },
	-- 			indent = { enable = true },
	-- 		})
	-- 	end,
}
