return {
	{
		"neovim/nvim-lspconfig",
	},

	{
		"p00f/clangd_extensions.nvim",
		lazy = true,
		enabled = function()
			return vim.fn.executable("clangd") == 1
		end,
	},
}
