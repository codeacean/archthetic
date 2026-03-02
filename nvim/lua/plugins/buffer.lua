return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false, -- usually best for tabline plugins
		version = "^1.0.0", -- pin until ready for upgrade
		init = function()
			vim.g.barbar_auto_setup = false
			vim.opt.showtabline = 2 -- always show
		end,
		opts = {
			animation = true,
			auto_hide = false,
			tabpages = true,
			clickable = false,
			focus_on_close = "left",
			insert_at_end = true,
			maximum_padding = 3,
			minimum_padding = 1,
			no_name_title = "whf, give it a name",

			icons = {
				buffer_index = true,
				buffer_number = false,
				button = "✕",
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "●" },
					[vim.diagnostic.severity.WARN] = { enabled = true, icon = "●" },
				},
				filetype = { enabled = true },
				inactive = { button = "✕", modified = { button = "●" } },
				modified = { button = "●" },
				pinned = { button = " ", filename = { italic = true, bold = true } },
				separator = { left = "▎", right = "▎" },
			},

			sidebar_filetypes = {
				NvimTree = true,
				neo_tree = { event = "BufWipeout" },
				Outline = true,
			},
		},

		config = function(_, barbar_opts)
			require("barbar").setup(barbar_opts)

			local map = vim.keymap.set
			local keymap_opts = { noremap = true, silent = true } -- renamed to avoid conflict

			-- Navigation
			map("n", "<leader>bp", "<Cmd>BufferPrevious<CR>", { desc = "Prev buffer", unpack(keymap_opts) })
			map("n", "<leader>bn", "<Cmd>BufferNext<CR>", { desc = "Next buffer", unpack(keymap_opts) })
			map("n", "<leader>bmp", "<Cmd>BufferMovePrevious<CR>", { desc = "Move buffer ←", unpack(keymap_opts) })
			map("n", "<leader>bmn", "<Cmd>BufferMoveNext<CR>", { desc = "Move buffer →", unpack(keymap_opts) })

			-- Goto 1–9 / last
			map("n", "<leader>bb", "<Cmd>:Telescope scope buffers<CR>", { desc = "All Buffers", unpack(keymap_opts) })
			map(
				"n",
				"<leader>bl",
				"<Cmd>:Telescope current_buffer_fuzzy_find<CR>",
				{ desc = "Buffer Lines", unpack(keymap_opts) }
			)

			map("n", "<leader>b1", "<Cmd>BufferGoto 1<CR>", { desc = "Buffer 1", unpack(keymap_opts) })
			map("n", "<leader>b2", "<Cmd>BufferGoto 2<CR>", { desc = "Buffer 2", unpack(keymap_opts) })
			map("n", "<leader>b3", "<Cmd>BufferGoto 3<CR>", { desc = "Buffer 3", unpack(keymap_opts) })
			map("n", "<leader>b4", "<Cmd>BufferGoto 4<CR>", { desc = "Buffer 4", unpack(keymap_opts) })
			map("n", "<leader>b5", "<Cmd>BufferGoto 5<CR>", { desc = "Buffer 5", unpack(keymap_opts) })
			map("n", "<leader>b6", "<Cmd>BufferGoto 6<CR>", { desc = "Buffer 6", unpack(keymap_opts) })
			map("n", "<leader>b7", "<Cmd>BufferGoto 7<CR>", { desc = "Buffer 7", unpack(keymap_opts) })
			map("n", "<leader>b8", "<Cmd>BufferGoto 8<CR>", { desc = "Buffer 8", unpack(keymap_opts) })
			map("n", "<leader>b9", "<Cmd>BufferGoto 9<CR>", { desc = "Buffer 9", unpack(keymap_opts) })
			map("n", "<leader>b0", "<Cmd>BufferLast<CR>", { desc = "Last buffer", unpack(keymap_opts) })

			-- Buffer actions
			map("n", "<leader>bP", "<Cmd>BufferPin<CR>", { desc = "Pin buffer", unpack(keymap_opts) })
			map("n", "<leader>bc", "<Cmd>BufferClose<CR>", { desc = "Close buffer", unpack(keymap_opts) })
			map("n", "<leader>bC", "<Cmd>BufferWipeout<CR>", { desc = "Wipeout buffer", unpack(keymap_opts) })
			map(
				"n",
				"<leader>bo",
				"<Cmd>BufferCloseAllButCurrentOrPinned<CR>",
				{ desc = "Close others except pinned", unpack(keymap_opts) }
			)
			map("n", "<leader>br", "<Cmd>BufferRestore<CR>", { desc = "Restore closed buffer", unpack(keymap_opts) })

			-- sorting
			map("n", "<Space>bon", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
			map("n", "<Space>boN", "<Cmd>BufferOrderByName<CR>", opts)
			map("n", "<Space>bod", "<Cmd>BufferOrderByDirectory<CR>", opts)
		end,
	},

	{
		"tiagovla/scope.nvim",
		event = "VeryLazy",
		opts = {
			restore = true,
			tabline = {
				name = function(tab)
					local bufs = vim.api.nvim_tabpage_list_wins(tab)
					local buf = vim.api.nvim_win_get_buf(bufs[1])
					return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
				end,
			},
		},
		config = function(_, opts)
			require("scope").setup(opts)
			vim.api.nvim_create_autocmd("User", {
				pattern = "ScopeTabEnter",
				callback = function()
					vim.cmd("redrawtabline")
				end,
			})
		end,
	},

	{
		"yorickpeterse/nvim-window",
		keys = {
			{ "<leader>ww", "<cmd>lua require('nvim-window').pick()<cr>", desc = "Pick window" },
		},
		opts = {
			chars = {
				"a",
				"s",
				"d",
				"f",
				"g",
				"h",
				"j",
				"k",
				"l",
				"q",
				"w",
				"e",
				"r",
				"t",
				"y",
				"u",
				"i",
				"o",
				"p",
				"z",
				"x",
				"c",
				"v",
				"b",
				"n",
				"m",
			},

			show_single = false,
			blend = 0.7,
			duration = 3000,
		},
	},
}
