-- local telescope = require("telescope")
-- local telescope_actions = require("telescope.actions")
-- local telescope_builtin = require("telescope.builtin")

-- telescope.setup({
-- 	defaults = {
-- 		file_ignore_patterns = { "%.git/", "node_modules/", "coverage/", "__pycache__/", "%.o", "client/graphql/" },
-- 		mappings = {
-- 			i = {
-- 				["<C-k>"] = telescope_actions.move_selection_previous,
-- 				["<C-j>"] = telescope_actions.move_selection_next,
-- 			},
-- 		},
-- 	},
-- })

-- vim.keymap.set("n", "<Leader>s", function()
-- 	telescope_builtin.find_files({ hidden = true })
-- end, { desc = "Find files" })

-- vim.keymap.set("n", "<Leader>c", function()
-- 	telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") })
-- end, { desc = "Find files within vim config" })

-- vim.keymap.set("n", "<Leader>f", function()
-- 	telescope_builtin.live_grep()
-- end, { desc = "Grep files" })

-- vim.keymap.set("n", "<Leader>fh", function()
-- 	telescope_builtin.help_tags()
-- end, { desc = "Help tags" })

-- vim.keymap.set("n", "<Leader>fb", function()
-- 	telescope_builtin.buffers()
-- end, { desc = "Show buffers" })

-- vim.keymap.set("n", "<Leader>gs", function()
-- 	telescope_builtin.git_status()
-- end, { desc = "Git status" })
--
--
local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					-- your custom normal mode mappings
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")
telescope.load_extension("projects")

vim.keymap.set("n", ";f", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)
vim.keymap.set("n", ";r", function()
	builtin.live_grep()
end)
vim.keymap.set("n", "\\\\", function()
	builtin.buffers()
end)
vim.keymap.set("n", ";t", function()
	builtin.help_tags()
end)
vim.keymap.set("n", ";;", function()
	builtin.resume()
end)
vim.keymap.set("n", ";e", function()
	builtin.diagnostics()
end)
vim.keymap.set("n", "sf", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end)
