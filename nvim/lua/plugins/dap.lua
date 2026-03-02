return {
	{
		"mfussenegger/nvim-dap",
		lazy = true, -- loaded by keys or events below
		dependencies = {
			{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = { "williamboman/mason.nvim" },
				opts = {
					ensure_installed = { "codelldb" },
					automatic_installation = true,
					handlers = {}, -- important: let mason-nvim-dap auto-setup adapters
				},
			},
		},

		keys = {
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "Debug: Continue / Start",
			},
			{
				"<F10>",
				function()
					require("dap").step_over()
				end,
				desc = "Debug: Step Over",
			},
			{
				"<F11>",
				function()
					require("dap").step_into()
				end,
				desc = "Debug: Step Into",
			},
			{
				"<F12>",
				function()
					require("dap").step_out()
				end,
				desc = "Debug: Step Out",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Debug: Toggle Breakpoint",
			},
			{
				"<leader>B",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Debug: Conditional Breakpoint",
			},
			{
				"<leader>dr",
				function()
					require("dap").repl.toggle()
				end,
				desc = "Debug: Toggle REPL",
			},
			{
				"<leader>dl",
				function()
					require("dap").run_last()
				end,
				desc = "Debug: Run Last",
			},
		},

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Auto-open/close UI when debugging starts/ends
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Nice icons (optional but looks good)
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "⊙", texthl = "DiagnosticWarn", linehl = "", numhl = "" }
			)
			vim.fn.sign_define(
				"DapStopped",
				{ text = "➜", texthl = "DiagnosticOk", linehl = "CursorLine", numhl = "" }
			)

			-- codelldb is auto-configured by mason-nvim-dap
			-- But we still define good default configurations for C++
			dap.configurations.cpp = {
				{
					name = "Launch file (codelldb)",
					type = "codelldb",
					request = "launch",
					program = function()
						-- Ask for the executable (or hardcode / auto-detect in real projects)
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,

					-- Important for nice variable display & stdio
					terminal = {
						kind = "integrated", -- or "external" if you prefer kitty/alacritty
					},

					-- Optional: pass args, env, etc.
					-- args = { "arg1", "arg2" },
					-- env = { SOME_VAR = "value" },
				},
			}

			-- Reuse the same config for C and Rust (very common)
			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			-- Setup UI (you can customize layouts later)
			dapui.setup({
				icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
				controls = { icons = { pause = "⏸", play = "▶", step_into = "⤵" } },
			})
		end,
	},
}
