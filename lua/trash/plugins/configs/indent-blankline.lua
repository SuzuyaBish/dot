vim.cmd([[highlight Lines guifg=#2B2A36 gui=nocombine]])

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	char_highlight_list = {
		"Lines",
	},
})
