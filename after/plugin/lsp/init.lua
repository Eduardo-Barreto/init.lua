local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("lsp failed to load")
	return
end

require("eduardo-barreto.lsp.handlers").setup()
