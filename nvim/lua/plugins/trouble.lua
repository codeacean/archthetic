return {
	"folke/trouble.nvim",
	opts = {
		modes = {
			diagnostics = {
				preview = { type = "split", relative = "win", position = "right", size = 0.4 },
			},
			lsp = {
				preview = { type = "split", relative = "win", position = "right", size = 0.45 },
			},
			symbols = {
				filter = { range = true },
			},
		},
		win = {
			border = "rounded",
			position = "bottom",
			size = { height = 12 }, -- bigger height = better for long diagnostics
			wo = { cursorline = true },
		},
		icons = {
			ERROR = " ",
			WARN = " ",
			INFO = " ",
			HINT = "󰌵 ",
			other = " ",
		},
	},

	cmd = "Trouble",

	keys = {
		{ "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (all)" },
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (current buffer)" },

		{
			"<leader>xl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP info (defs/refs/...) → Trouble",
		},
		{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Document Symbols (outline)" },

		{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
		{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },

		{
			"<leader>xc",
			"<cmd>Trouble diagnostics toggle filter.severity=ERROR<cr>",
			desc = "Show only Errors (C/C++)",
		},
	},
}
