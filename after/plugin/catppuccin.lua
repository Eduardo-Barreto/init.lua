local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	vim.notify("catppuccin failed to load")
	return
end

catppuccin.setup({
	flavour = "mocha",
	integrations = {
		neotree = true,
	},
})
