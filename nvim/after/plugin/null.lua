local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint_d.with({
			extra_filetypes = { "astro", "svelte" },
		}),
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.prettierd.with({
			extra_filetypes = { "astro", "svelte" },
		}),
		null_ls.builtins.diagnostics.write_good,

		null_ls.builtins.diagnostics.golangci_lint, -- golang | https://github.com/golangci/golangci-lint (~/.golangci.yml)
		null_ls.builtins.diagnostics.staticcheck, -- golang | https://github.com/dominikh/go-tools
		null_ls.builtins.formatting.fixjson, -- json | https://github.com/rhysd/fixjson
		null_ls.builtins.formatting.goimports_reviser, -- golang | https://pkg.go.dev/github.com/incu6us/goimports-reviser
		null_ls.builtins.formatting.markdown_toc, -- markdown | https://github.com/jonschlinkert/markdown-toc
		null_ls.builtins.formatting.mdformat, -- markdown | https://github.com/executablebooks/mdformat
		null_ls.builtins.formatting.shfmt, -- shell | https://github.com/mvdan/sh
		null_ls.builtins.formatting.yamlfmt, -- yaml | https://github.com/google/yamlfmt
		null_ls.builtins.formatting.taplo, -- toml | https://taplo.tamasfe.dev/
	},
	-- filetypes = { "html", "json", "yaml", "markdown", "astro", "typescript", "javascript", "typescript.tsx" },
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
