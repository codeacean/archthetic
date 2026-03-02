return {
	"numToStr/Comment.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("Comment").setup({
			opleader = {
				line = "gc", -- operator-pending line comment
				block = "gb", -- operator-pending block comment
			},

			mappings = {
				basic = true, -- gc / gb + motions
				extra = true, -- gcO, gco, gcA
				extended = false, -- not using g> / g< etc.
			},

			pre_hook = require("ts-context-commentstring.integrations.comment_nvim").create_pre_hook(),
			post_hook = nil,
			ignore = "^\\s*$",
			toggler = {
				line = "gcc", -- toggle current line
				block = "gbc", -- toggle current block
			},

			extra = {
				above = "gcO", -- comment line above (insert mode style)
				below = "gco", -- comment line below
				eol = "gcA", -- append comment at end of line
			},
		})

		local api = require("Comment.api")

		vim.keymap.set("n", "<leader>/", api.toggle.linewise.current, { desc = "Toggle comment line" })
		vim.keymap.set("v", "<leader>/", function()
			api.toggle.linewise(vim.fn.visualmode())
		end, { desc = "Toggle comment (visual)" })

		vim.keymap.set("n", "<leader>?", api.toggle.blockwise.current, { desc = "Toggle block comment" })
	end,
}
