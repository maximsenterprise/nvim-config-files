return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver",
				"eslint",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"asm_lsp",
				"bashls",
				"omnisharp",
				"clangd",
				"cmake",
				"cssls",
				"crystalline",
				"elixirls",
				"hls",
				"autotools_ls",
				"nim_langserver",
				"ocamllsp",
				"fsautocomplete",
				"gopls",
				"erlangls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
				"asmfmt",
				"clang-format",
				"csharpier",
				"rustfmt",
				"cspell",
				"hlint",
				"rstcheck",
				"swiftlint",
				"golangci-lint",
				"ocamlformat",
			},
		})
	end,
}
