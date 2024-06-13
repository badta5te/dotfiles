return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>", {})

		require("neo-tree").setup({
			default_component_configs = {
				filesystem = {
					follow_current_file = {
						enabled = true, -- This will find and focus the file in the active buffer every time
						--               -- the current file is changed while the tree is open.
						leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
					},
				},
			},
			filesystem = {
				window = {
					mappings = {
						["O"] = "system_open",
					},
				},
			},
			commands = {
				system_open = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					-- macOS: open file in default application in the background.
					vim.fn.jobstart({ "open", "-g", path }, { detach = true })
				end,
			},
		})
	end,
}
