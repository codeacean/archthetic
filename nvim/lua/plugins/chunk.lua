return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- lazy-load properly
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				use_treesitter = true,
				style = {
					{ fg = "#806d9c" }, -- main box color (purple-ish, subtle)
					{ fg = "#c678dd" }, -- arrow / corner color (brighter accent)
				},

				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = "⟩", -- the moving arrow that shows nesting level
				},

				textobject = "ic", -- `vic` / `yic` to select inside current chunk (very useful!)
				max_file_size = 1024 * 300, -- ~300 KB
				error_sign = true, -- show error icon if Treesitter parsing fails
				duration = 150,
				delay = 50,
			},

			-- indent = {
			-- 	enable = true,
			-- 	chars = { "│", "┊", "┆", "⋮" }, -- or try {"▏", "▎", "▍", "▌"}
			-- 	style = {
			-- 		{ fg = "#333854" }, -- level 1
			-- 		{ fg = "#3b4261" }, -- level 2
			-- 		{ fg = "#444b6a" }, -- level 3
			-- 		{ fg = "#545c7e" }, -- level 4
			-- 	},
			--
			-- },
			--
			-- line_num = {
			-- 	enable = false, -- set to true if you like it
			--
			-- 	style = "#806d9c",
			-- },
			--
			-- blank = {
			-- 	enable = false, -- usually not needed
			-- },

			exclude_filetypes = {
				aerial = true,
				dashboard = true,
				alpha = true,
				NvimTree = true,
				TelescopePrompt = true,
				help = true,
			},
		})
	end,
}
