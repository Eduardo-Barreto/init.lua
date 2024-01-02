local formatter_status_ok, formatter = pcall(require, "formatter")
if not formatter_status_ok then
	vim.notify("formatter failed to load")
	return
end

local util_status_ok, util = pcall(require, "formatter.util")
if not util_status_ok then
	vim.notify("formatter util failed to load")
	return
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
formatter.setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		python = {
			require("formatter.filetypes.python").black,
		},

		cpp = {
			require("formatter.filetypes.cpp").uncrustify,

			function()
				return {
					exe = "uncrustify",
					args = {
						"-c",
						"./uncrustify.cfg",
					},
					stdin = true,
				}
			end,
		},

		c = {
			require("formatter.filetypes.cpp").uncrustify,

			function()
				return {
					exe = "uncrustify",
					args = {
						"-c",
						"./uncrustify.cfg",
					},
					stdin = true,
				}
			end,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
