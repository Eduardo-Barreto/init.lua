return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		null_ls.setup({
			sources = {
				formatting.prettier,
				formatting.black.with({ extra_args = { "--fast" } }),
				formatting.stylua,
				formatting.uncrustify.with({
					args = { "-c", "./uncrustify.cfg" },
					filetypes = { "h", "hpp", "c", "cpp" },
				}),
				diagnostics.flake8,
			},
		})

		vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)
	end,
}
