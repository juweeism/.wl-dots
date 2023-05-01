local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint_d.with({
			extra_filetypes = { "astro" },
		}),
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.prettierd.with({
			extra_filetypes = { "astro" },
		}),
		null_ls.builtins.diagnostics.write_good,
	},
	filetypes = { "html", "json", "yaml", "markdown", "astro", "typescript", "javascript", "typescript.tsx" },
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- vim.lsp.buf.formatting_sync()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
