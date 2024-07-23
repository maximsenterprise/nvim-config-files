return {
	"MunifTanjim/eslint.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("eslint").setup({
			bin = "eslint",
			code_actions = {
				enable = true,
				apply_on_save = {
					enable = true,
					types = { "directive", "problem", "suggestion", "layout" },
				},
				disable_rule_comment = {
					enable = true,
					location = "separate_line",
				},
			},
			diagnostics = {
				enable = true,
				report_unused_disable_directives = false,
				run_on = "type",
			},
		})
	end,
}
