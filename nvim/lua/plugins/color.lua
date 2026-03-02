return {
	{
		"tribela/transparent.nvim",
		event = "VimEnter", -- or "VeryLazy" if you prefer even later loading
		config = function()
			vim.keymap.set("n", "<leader>st", ":TransparentToggle<CR>", {
				desc = "Toggle transparency",
				silent = true,
			})

			require("transparent").setup({
				auto = true,
				extra_groups = {
					"NormalFloat",
					"FloatBorder",
				},
				exclude_groups = {},
				on_clear = function() end,
				groups = {
					"Telescope",
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLine",
					"CursorLineNr",
					"StatusLine",
					"StatusLineNC",
					"EndOfBuffer",
				},
			})
		end,
	},

	-- Colorschemes
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	{ "folke/tokyonight.nvim", name = "tokyonight", lazy = false, priority = 1000 },

	{
		"serhez/teide.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	{
		"wurli/cobalt.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "darker",
			})
			require("onedark").load()
		end,
	},

	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = {} },
}
