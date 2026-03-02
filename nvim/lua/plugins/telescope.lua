return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local themes = require("telescope.themes")

		--  Main setup
		telescope.setup({
			defaults = {
				theme = "ivy",

				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,

						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,

						["<C-c>"] = actions.close,
						["<esc>"] = actions.close,

						["<CR>"] = actions.select_default,
						["<C-s>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},

					n = {
						["q"] = actions.close,
						["<C-c>"] = actions.close,
					},
				},

				-- appearance
				prompt_prefix = "   ",
				selection_caret = "❯ ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},

				file_ignore_patterns = {
					"node_modules",
					"%.git/",
					"%.cache",
					"vendor",
					"%.DS_Store",
					"target/",
					"dist/",
					"build/",
					"coverage/",
				},

				-- better performance + nicer preview
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},
			},

			--  Pickers specific settings
			pickers = {
				find_files = {
					hidden = true,
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					-- theme = "dropdown",
				},

				live_grep = {
					additional_args = function()
						return { "--hidden", "--glob", "!**/.git/*" }
					end,
				},

				buffers = {
					sort_lastused = true,
					theme = "ivy",
					previewer = false,
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer,
						},
						n = {
							["dd"] = actions.delete_buffer,
						},
					},
				},

				oldfiles = {
					only_cwd = true, -- only show files from current project
				},
			},

			--  Extensions
			extensions = {
				fzf = {
					fuzzy = true, -- false = exact matching
					override_generic_sorter = true, -- override default sorters
					override_file_sorter = true,
					case_mode = "smart_case",
				},

				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- even more opts
					}),
				},
			},
		})

		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")

		--  Keymaps – modern & useful layout
		local builtin = require("telescope.builtin")

		-- most used
		vim.keymap.set("n", "<leader><leader>f", builtin.find_files, { desc = "Find files (project)" })
		vim.keymap.set("n", "<leader><leader>g", builtin.live_grep, { desc = "Live grep (ripgrep)" })
		vim.keymap.set("n", "<leader><leader>b", "<Cmd>:Telescope scope buffers<CR>", { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
		vim.keymap.set("n", "<leader><leader>m", builtin.help_tags, { desc = "Help tags" })
		vim.keymap.set("n", "<leader><leader>r", builtin.oldfiles, { desc = "Recent files" })
		vim.keymap.set(
			"n",
			"<leader><leader>c",
			builtin.current_buffer_fuzzy_find,
			{ desc = "Fuzzy find in current buffer" }
		)
		vim.keymap.set("n", "<leader><leader>/", builtin.search_history, { desc = "Search history" })
		vim.keymap.set("n", "<leader>:", builtin.command_history, { desc = "Command history" })
		vim.keymap.set("n", "<leader>cs", builtin.colorscheme, { desc = "Command history" }) -- git related
		vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files (tracked)" })
		vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
		vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
		vim.keymap.set("n", "<leader>fS", builtin.lsp_dynamic_workspace_symbols, { desc = "Workspace symbols" })
		vim.keymap.set("n", "<leader>fo", function()
			builtin.resume({ cache_index = 1 })
		end, { desc = "Resume last Telescope" })

		vim.keymap.set("n", "<leader><leader>w", function()
			builtin.grep_string({ search = vim.fn.expand("<cword>") })
		end, { desc = "Grep word under cursor" })
	end,
}
