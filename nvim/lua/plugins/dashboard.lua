return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	opts = {
		theme = "hyper",
		disable_move = true,
		shortcut_type = "number",
		shuffle_letter = false,
		change_to_vcs_root = false,
		config = {
			header = {
				[[                                                                       ]],
				[[                                                                     ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                       ]],
			},
			center = {
				{ icon = " ", desc = "New file", action = "ene | startinsert", key = "e" },
				{ icon = " ", desc = "Find file", action = "Telescope find_files", key = "f" },
				{ icon = " ", desc = "Recent", action = "Telescope oldfiles", key = "r" },
				{ icon = " ", desc = "Find text", action = "Telescope live_grep", key = "g" },
				{ icon = " ", desc = "Config", action = "edit ~/.config/nvim/init.lua", key = "c" },
				{ icon = "󰩈 ", desc = "Quit", action = "qa", key = "q" },
			},
			shortcut = {
				{ desc = " Telescope", group = "Number", action = "Telescope", key = "t" },
				{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
				{ desc = " Lazy", group = "@property", action = "Lazy", key = "l" },
				{ desc = "󰏖 Meson", group = "@property", action = "Mason", key = "m" },
				{
					icon = "󰮗 ",
					icon_hl = "@variable",
					desc = "Files",
					group = "Label",
					action = "Telescope find_files",
					key = "f",
				},
				{
					desc = "󰌁 Color",
					group = "Number",
					action = "Telescope colorscheme",
					key = "c",
				},
			},
			packages = { enable = true },
			project = {
				enable = true,
				limit = 8,
				icon = " ",
				label = "",
				action = function(path)
					vim.cmd("Telescope find_files cwd=" .. vim.fn.fnameescape(path))
				end,
			},

			mru = {
				enable = true,
				limit = 10,
				icon = " ",
				label = "",
				cwd_only = false,
			},

			footer = {
				"",
				"",
				"Fuck off!! and CODE.",
			},
		},

		hide = {
			statusline = true,
			tabline = true,
			winbar = true,
		},
	},
}
