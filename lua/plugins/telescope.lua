return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")
			local keymap = vim.keymap

			telescope.load_extension("fzf")

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
			})

			keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
			keymap.set("n", "<leader>ffh", function()
				builtin.find_files({ no_ignore = true, hidden = true })
			end, { desc = "Find files (with hidden)" })
			keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
			keymap.set("n", "<leader>fgh", function()
				builtin.live_grep({
					additional_args = {
						"-u",
					},
				})
			end, { desc = "Live grep (with hidden)" })
			keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
