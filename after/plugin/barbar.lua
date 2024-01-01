local status_ok, barbar = pcall(require, "barbar")
if not status_ok then
	return
end

barbar.setup({
	focus_on_close = "previous",
	sidebar_filetypes = {
		NvimTree = { text = "Tree" },
		undotree = { text = "undotree" },
		Outline = { text = "symbols-outline" },
	},
})
