return {
	"rcarriga/nvim-notify",
	config = function()
		vim.opt.termguicolors = true
		vim.notify = require("notify")
		require("notify").setup({
			timeout = 2000,
		})
	end,
}
