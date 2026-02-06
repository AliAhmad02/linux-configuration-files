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
        ["Y"] = "copy_selector"
			},
		},

		commands = {
			system_open = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				-- Linux: open file in default application
				vim.fn.jobstart({ "xdg-open", path }, { detach = true })
			end,

 			copy_selector = function(state)
 				local node = state.tree:get_node()
 				local filepath = node:get_id()
 				local filename = node.name
 				local modify = vim.fn.fnamemodify
 
 				local vals = {
 					["BASENAME"] = modify(filename, ":r"),
 					["EXTENSION"] = modify(filename, ":e"),
 					["FILENAME"] = filename,
 					["PATH (CWD)"] = modify(filepath, ":."),
 					["PATH (HOME)"] = modify(filepath, ":~"),
 					["PATH"] = filepath,
 					["URI"] = vim.uri_from_fname(filepath),
 				}
 
 				local options = vim.tbl_filter(function(val)
 					return vals[val] ~= ""
 				end, vim.tbl_keys(vals))
 				if vim.tbl_isempty(options) then
 					vim.notify("No values to copy", vim.log.levels.WARN)
 					return
 				end
 				table.sort(options)
 				vim.ui.select(options, {
 					prompt = "Choose to copy to clipboard:",
 					format_item = function(item)
 						return ("%s: %s"):format(item, vals[item])
 					end,
 				}, function(choice)
 					local result = vals[choice]
 					if result then
 						vim.notify(("Copied: `%s`"):format(result))
 						vim.fn.setreg("+", result)
 					end
 				end)
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
	},
}
