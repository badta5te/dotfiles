return {
	"gbprod/nord.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("nord").setup({
			transparent = false,
			terminal_colors = true,
			borders = true,
			search = {
				theme = "vscode",
			},
			styles = {
				comments = {
					italic = true,
				},
				functions = {
					bold = true,
					italic = true,
				},
				bufferline = {
					current = {},
					modified = { italic = true },
				},
			},
		})

		vim.cmd.colorscheme("nord")
	end,
}
