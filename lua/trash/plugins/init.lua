local user_plugins = {
	-- Core
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<Leader>g", "<Cmd>Git<CR>", { desc = "Git status" })
		end,
	},
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"tpope/vim-repeat",
	"tpope/vim-rhubarb",
	"janko/vim-test",
	"jiangmiao/auto-pairs",
	"mattn/emmet-vim",
	"kevinhwang91/nvim-bqf",
	"manzeloth/live-server",

	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<Leader>u", "<Cmd>UndotreeToggle<CR>", { desc = "Open undo tree" })
		end,
	},

	-- Markdown preview

	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- Dashboard
	{
		"goolord/alpha-nvim",
		config = function()
			require("trash.plugins.configs.alpha")
		end,
	},

	-- Comment
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Indent Blankline
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("trash.plugins.configs.indent-blankline")
		end,
	},

	-- Project

	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("trash.plugins.configs.project")
		end,
	},

	{
		"EdenEast/nightfox.nvim",
	},

	-- Float terminal
	{
		"voldikss/vim-floaterm",
		config = function()
			require("trash.plugins.configs.float-term")
		end,
	},

	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("trash.plugins.configs.neo-tree")
		end,
	},

	-- Telescope
	{
		"nvim-lua/telescope.nvim",
		branch = "0.1.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			require("trash.plugins.configs.telescope")
		end,
	},

	-- Whichkey
	{
		"folke/which-key.nvim",
		config = function()
			require("trash.plugins.configs.which-key")
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		requires = {
			"mfussenegger/nvim-dap",
			"creativenull/diagnosticls-configs-nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"jayp0521/mason-nvim-dap.nvim",
			"glepnir/lspsaga.nvim",
			"simrat39/rust-tools.nvim",
		},
		config = function()
			require("lspsaga").init_lsp_saga({ border_style = "rounded" })
			require("mason").setup()

			require("trash.plugins.configs.lspconfig")

			require("trash.plugins.configs.dap")
		end,
	},

	-- Lsp Zero

	{
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			"jose-elias-alvarez/null-ls.nvim",
		},
	},

	-- Autocompletion and Snippets
	{
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("trash.plugins.configs.cmp")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("trash.plugins.configs.treesitter")
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		opt = true,
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	-- Theme/Syntax
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "rebelot/kanagawa.nvim", as = "kanagawa" },
	{
		"rose-pine/neovim",
		config = function()
			require("trash.colorscheme")
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("trash.colorscheme")
		end,
	},

	{
		"akinsho/bufferline.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trash.plugins.configs.bufferline")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trash.plugins.configs.lualine")
		end,
	},
	"princejoogie/tailwind-highlight.nvim",
}

-- Plugin Setup
-- ============
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").init({
	compile_path = string.format("%s/site/plugin/packer_compiled.lua", vim.fn.stdpath("data")),
	display = {
		prompt_border = "rounded",
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- My plugins here
	for _, user_plugin in pairs(user_plugins) do
		use(user_plugin)
	end

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
