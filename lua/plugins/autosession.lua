return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
			session_lens = {
				buftypes_to_ignore = {},
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>wls", require("auto-session.session-lens").search_session, { noremap = true, desc = "List all sessions" })
		keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Reswore session for cwd" }) -- restore last workspace session for current directory
		keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
	end,
}
