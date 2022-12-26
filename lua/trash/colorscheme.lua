-- local catppuccin = require("catppuccin")
--
-- if not catppuccin then
-- 	return
-- end
--
-- vim.g.catppuccin_flavour = "macchiato"
--
-- catppuccin.setup()
--
-- vim.cmd([[colorscheme catppuccin]])

-- local kanagawa = require("kanagawa")
--
-- if not kanagawa then
-- 	return
-- else
-- 	kanagawa.setup({
-- 		undercurl = true, -- enable undercurls
-- 		commentStyle = { italic = true },
-- 		functionStyle = {},
-- 		keywordStyle = { italic = true },
-- 		statementStyle = { bold = true },
-- 		typeStyle = {},
-- 		variablebuiltinStyle = { italic = true },
-- 		specialReturn = true, -- special highlight for the return keyword
-- 		specialException = true, -- special highlight for exception handling keywords
-- 		transparent = false, -- do not set background color
-- 		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
-- 		globalStatus = false, -- adjust window separators highlight for laststatus=3
-- 		terminalColors = true, -- define vim.g.terminal_color_{0,17}
-- 		colors = {},
-- 		overrides = {},
-- 		theme = "dark",
-- 	})
-- end
--
-- vim.cmd([[colorscheme kanagawa]])
-- --
-- --

--vim.cmd([[colorscheme iceberg]])
--#region

-- require("rose-pine").setup({
-- 	--- @usage 'main' | 'moon'
-- 	dark_variant = "main",
-- 	bold_vert_split = false,
-- 	dim_nc_background = false,
-- 	disable_background = true,
-- 	disable_float_background = false,
-- 	disable_italics = false,
--
-- 	-- Change specific vim highlight groups
-- 	highlight_groups = {
-- 		ColorColumn = { bg = "rose" },
-- 	},
-- })
--
-- -- set colorscheme after options
-- vim.cmd("colorscheme rose-pine")

require("tokyonight").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	light_style = "day", -- The theme is used when the background is set to light
	transparent = true, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = false, -- dims inactive windows
	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	on_colors = function(colors) end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights Highlights
	---@param colors ColorScheme
	on_highlights = function(highlights, colors) end,
})

vim.cmd("colorscheme tokyonight")
