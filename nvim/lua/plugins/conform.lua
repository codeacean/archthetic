return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true, lsp_fallback = false })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			cmake = { "cmake_format" }, -- optional, if you use cmake
		},
		format_on_save = false,
		formatters = {
			clang_format = {
				-- Use project .clang-format if exists, fallback to LLVM
				prepend_args = { "--fallback-style=LLVM" },
			},
		},
	},
}
