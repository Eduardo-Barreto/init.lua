local status_ok, tree_sitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("tree-sitter failed to load")
	return
end

tree_sitter.setup({
	ensure_installed = {
		"javascript",
		"typescript",
		"c",
		"cpp",
		"lua",
		"vim",
		"vimdoc",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
