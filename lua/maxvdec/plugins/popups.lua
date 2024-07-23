return {
	"rcarriga/nvim-notify",
	config = function()
		vim.opt.termguicolors = true
		vim.notify = require("notify")
		require("notify").setup({
			timeout = 1000,
		})
	end,
}
