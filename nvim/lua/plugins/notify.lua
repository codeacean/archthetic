return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")

		notify.setup({
			-- Positioning & animation
			top_down = true,
			render = "compact",
			stages = "slide",
			timeout = 2000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.5)
			end,

			icons = {
				ERROR = " ", -- nf-fa-times_circle
				WARN = " ", -- nf-fa-exclamation_triangle
				INFO = " ", -- nf-fa-info_circle
				DEBUG = " ", -- nf-fa-bug
				TRACE = " ", -- nf-cod-chevron_right
			},

			background_colour = "Normal",
			fps = 60,
		})

		vim.notify = notify

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>nh", "<cmd>Telescope notify<cr>", { -- OPEN history
			desc = "Open notification history",
			noremap = true,
			silent = true,
		})

		local orig_notify = vim.notify
		vim.notify = function(msg, level, opts)
			opts = opts or {}
			level = level or vim.log.levels.INFO

			if level == vim.log.levels.ERROR then
				opts.timeout = opts.timeout or 10000 -- 10s for errors
			elseif level == vim.log.levels.WARN then
				opts.timeout = opts.timeout or 5000 -- 5s for warnings
			end

			if type(msg) == "string" and msg:len() > 150 then
				opts.replace = true
			end

			return orig_notify(msg, level, opts)
		end

		vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#f44336", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#ff9800", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#2196f3", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#9c27b0", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#15161e" }) -- Semi-transparent bg
	end,
}
