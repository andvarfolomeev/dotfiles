return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

		vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

		local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(function()
			require("mini.diff").goto_hunk("next")
		end, function()
			require("mini.diff").goto_hunk("prev")
		end)
		vim.keymap.set({ "n", "x", "o" }, "]h", next_hunk_repeat)
		vim.keymap.set({ "n", "x", "o" }, "[h", prev_hunk_repeat)

		local next_buffer_repeat, prev_buffer_repeat = ts_repeat_move.make_repeatable_move_pair(function()
			vim.cmd([[ bnext ]])
		end, function()
			vim.cmd([[ bprev ]])
		end)
		vim.keymap.set({ "n", "x", "o" }, "]b", next_buffer_repeat)
		vim.keymap.set({ "n", "x", "o" }, "[b", prev_buffer_repeat)

		local next_diagnostic_repeat, prev_diagnostic_repeat = ts_repeat_move.make_repeatable_move_pair(function()
			vim.diagnostic.goto_next()
		end, function()
			vim.diagnostic.goto_prev()
		end)
		vim.keymap.set({ "n", "x", "o" }, "]h", next_diagnostic_repeat)
		vim.keymap.set({ "n", "x", "o" }, "[h", prev_diagnostic_repeat)

		local ts_config = require("nvim-treesitter.configs")

		---@diagnostic disable-next-line: missing-fields
		ts_config.setup({
			ensure_installed = {
				"dockerfile",
				"javascript",
				"typescript",
				"json",
				"lua",
				"python",
				"go",
				"gomod",
				"gosum",
				"http",
			},
			highlight = { enable = true },
			textobjects = {
				select = {
					enable = true,
					keymaps = {
						["al"] = "@assignment.lhs",
						["ar"] = "@assignment.rhs",
						["as"] = "@assignment.outer",
						["aS"] = "@assignment.inner",
						["ab"] = "@block.outer",
						["aB"] = "@block.inner",
						["ac"] = "@call.outer",
						["aC"] = "@call.inner",
						["ak"] = "@class.outer",
						["aK"] = "@class.inner",
						["af"] = "@function.outer",
						["aF"] = "@function.inner",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>p"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>P"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					goto_next_start = { ["]F"] = "@function.outer", ["]c"] = "@class.outer" },
					goto_next_end = { ["]f"] = "@function.inner", ["]C"] = "@class.outer" },
					goto_previous_start = {
						["[f"] = "@function.inner",
						["[F"] = "@function.outer",
						["[c"] = "@class.outer",
					},
					goto_previous_end = { ["[C"] = "@class.outer" },
				},
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "+",
					node_incremental = "+",
					node_decremental = "-",
				},
			},
		})
	end,
}
