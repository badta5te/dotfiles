return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
			"debugloop/telescope-undo.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")
			local transform_mod = require("telescope.actions.mt").transform_mod

			local trouble = require("trouble")
			local trouble_telescope = require("trouble.providers.telescope")

			-- or create your custom action
			local custom_actions = transform_mod({
				open_trouble_qflist = function(prompt_bufnr)
					trouble.toggle("quickfix")
				end,
			})

			local keymap = vim.keymap

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
							["<C-t>"] = trouble_telescope.smart_open_with_trouble,
						},
					},
				},
				extensions = {
					undo = {
						-- telescope-undo.nvim config, see below
					},
					-- other extensions:
					-- file_browser = { ... }
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
			keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
			keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })
			keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Show keymap" })
			keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

			telescope.load_extension("fzf")
			telescope.load_extension("undo")
			telescope.load_extension("noice")
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
