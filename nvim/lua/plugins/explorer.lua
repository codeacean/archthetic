return {
	---@type LazySpec
	{
		"mikavilpas/yazi.nvim",
		version = "*", -- use the latest stable version
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>-",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<leader>y",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<c-up>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		init = function()
			vim.g.loaded_netrwPlugin = 1
		end,

		---@type YaziConfig | {}
		opts = {
			-- If you are also using neotree, you may prefer not to bring it up when
			-- opening a directory:
			-- {
			--   "nvim-neo-tree/neo-tree.nvim",
			--   opts = {
			--     filesystem = {
			--       hijack_netrw_behavior = "disabled",
			--     },
			--   },
			-- }
			open_for_directories = false,
			open_multiple_tabs = false,
			change_neovim_cwd_on_close = false,
			highlight_groups = {
				hovered_buffer = nil,
				hovered_buffer_in_same_directory = nil,
			},

			floating_window_scaling_factor = 0.9,
			yazi_floating_window_winblend = 0,
			yazi_floating_window_border = "rounded",
			yazi_floating_window_zindex = nil,
			log_level = vim.log.levels.OFF,
			open_file_function = function(chosen_file, config, state) end,
			keymaps = {
				show_help = "<f1>",
				open_file_in_vertical_split = "<c-v>",
				open_file_in_horizontal_split = "<c-x>",
				open_file_in_tab = "<c-t>",
				grep_in_directory = "<c-s>",
				replace_in_directory = "<c-g>",
				cycle_open_buffers = "<tab>",
				copy_relative_path_to_selected_files = "<c-y>",
				send_to_quickfix_list = "<c-q>",
				change_working_directory = "<c-\\>",
				open_and_pick_window = "<c-o>",
			},
			set_keymappings_function = function(yazi_buffer_id, config, context) end,
			clipboard_register = "*",
			hooks = {
				yazi_opened = function(preselected_path, yazi_buffer_id, config) end,
				yazi_closed_successfully = function(chosen_file, config, state) end,
				yazi_opened_multiple_files = function(chosen_files, config, state) end,
				on_yazi_ready = function(buffer, config, process_api) end,
				before_opening_window = function(window_options) end,
			},

			-- highlight buffers in the same directory as the hovered buffer
			highlight_hovered_buffers_in_same_directory = true,

			integrations = {
				--- What should be done when the user wants to grep in a directory
				grep_in_directory = function(directory)
					-- the default implementation uses telescope if available, otherwise nothing
				end,

				grep_in_selected_files = function(selected_files)
					-- similar to grep_in_directory, but for selected files
				end,

				--- Similarly, search and replace in the files in the directory
				replace_in_directory = function(directory)
					-- default: grug-far.nvim
				end,

				replace_in_selected_files = function(selected_files)
					-- default: grug-far.nvim
				end,

				-- `grealpath` on OSX, (GNU) `realpath` otherwise
				resolve_relative_path_application = "",

				-- the way to resolve relative paths. The default_implementation can be
				-- customized with a function. See
				-- documentation/copy-relative-path-to-files.md for more information.
				resolve_relative_path_implementation = function(args, get_relative_path) end,

				-- how to delete (close) a buffer. Defaults to a bundled version of
				-- `snacks.bufdelete`, copied from https://github.com/folke/snacks.nvim,
				-- which maintains the window layout. See the `types.lua` file for more
				-- information for the available options.
				bufdelete_implementation = "bundled-snacks",

				-- add an action to a file picker to copy the relative path to the
				-- selected file(s). The implementation is the same as for the
				-- `copy_relative_path_to_selected_files` yazi.nvim keymap. Currently
				-- only snacks.nvim is supported. Documentation can be found in the
				-- keybindings section of the readme.
				--
				-- available options:
				-- - nil (default, no action added)
				-- - "snacks.picker" (snacks.nvim)
				picker_add_copy_relative_path_action = nil,
			},

			future_features = {
				-- use a file to store the last directory that yazi was in before it was
				-- closed. Defaults to `true`.
				use_cwd_file = true,

				-- use a new shell escaping implementation that is more robust and works
				-- on more platforms. Defaults to `true`. If set to `false`, the old
				-- shell escaping implementation will be used, which is less robust and
				-- may not work on all platforms.
				new_shell_escaping = true,
			},
		},
	},

	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false, -- often set as default file opener
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open Oil Explorer" },
			{ "<leader>e", "<cmd>Oil --float<cr>", desc = "Floating Oil Explorer" },
		},
		opts = {
			default_file_explorer = true, -- replaces netrw
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
			},
			float = {
				padding = 2,
				max_width = 90,
				max_height = 0.9,
				border = "rounded",
				win_options = { winblend = 0 },
			},
			preview = {
				max_width = 0.9,
				max_height = 0.9,
				border = "rounded",
			},
			progress = {
				max_width = 0.9,
				min_width = { 40, 0.4 },
				width = nil,
				min_height = { 10, 0.3 },
				max_height = { 20, 0.9 },
				border = "rounded",
				minimized_border = "none",
			},
		},
	},
}
