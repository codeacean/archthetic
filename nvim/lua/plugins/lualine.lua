return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy", -- load later to keep startup fast
		opts = function(_, opts)
			local trouble = require("trouble")
			local symbols = trouble.statusline({
				mode = "lsp_document_symbols",
				groups = {},
				title = false,
				filter = { range = true },
				format = "{kind_icon}{symbol.name:Normal}",
				-- The following line is needed to fix the background color
				-- Set it to the lualine section you want to use
				hl_group = "lualine_c_normal",
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons", "Hashino/speed.nvim" },
		config = function()
			local trouble = require("trouble")
			local symbols = trouble.statusline({
				mode = "lsp_document_symbols",
				groups = {},
				title = false,
				filter = { range = true },
				format = "{kind_icon}{symbol.name:Normal}",
				hl_group = "lualine_c_normal",
			})
			table.insert(opts.sections.lualine_c, {
				symbols.get,
				cond = symbols.has,
			})
			require("lualine").setup({
				options = {
					theme = "auto", -- auto picks from your colorscheme (e.g. catppuccin/mocha)
					icons_enabled = true,
					component_separators = { left = "│", right = "│" },
					section_separators = { left = "", right = "" }, -- powerline arrows (change to '' for minimal)
					globalstatus = true, -- one statusline for all windows
					disabled_filetypes = { statusline = { "dashboard", "alpha", "lazy" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { { "filename", path = 1 } }, -- relative path
					-- lualine_v = { require("speed").current },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				extensions = { "neo-tree", "lazy", "oil" }, -- integrate with explorers
			})
		end,
	},
}
