return {
    {
	"williamboman/mason.nvim",
	config = function()
	    require("mason").setup({
		ui = {
		    ---@since 1.0.0
		    -- Whether to automatically check for new versions when opening the :Mason window.
		    check_outdated_packages_on_open = true,

		    ---@since 1.0.0
		    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },

		    ---@since 1.0.0
		    -- Width of the window. Accepts:
		    -- - Integer greater than 1 for fixed width.
		    -- - Float in the range of 0-1 for a percentage of screen width.
		    width = 0.8,

		    ---@since 1.0.0
		    -- Height of the window. Accepts:
		    -- - Integer greater than 1 for fixed height.
		    -- - Float in the range of 0-1 for a percentage of screen height.
		    height = 0.9,

		    icons = {
			---@since 1.0.0
			-- The list icon to use for installed packages.
			package_installed = "✓",
			---@since 1.0.0
			-- The list icon to use for packages that are installing, or queued for installation.
			package_pending = "➜",
			---@since 1.0.0
			-- The list icon to use for packages that are not installed.
			package_uninstalled = "✗"
		    },
		},
	    })
	end
    },
    {
	"williamboman/mason-lspconfig.nvim",
	config = function()
	    require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls", "pyright", "clangd", "verible" },
	    })
	end
    },
    {
	"neovim/nvim-lspconfig",
	config = function()
	    local lspconfig = require("lspconfig")
	    local lsp_flags = { debounce_text_changes = 150 }
	    local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                flags = lsp_flags,
                settings = {
                    Lua = {
                        diagnostics = {
                            global = { "vim" },
                        },
                    },
                },
            })
	    lspconfig.pyright.setup({
		capabilities = capabilities,
		flags = lsp_flags,
	    })
	    lspconfig.clangd.setup({
		capabilities = capabilities,
		flags = lsp_flags,
	    })
	    --[[ lspconfig.matlab_ls.setup({
		capabilities = capabilities,
		flags = lsp_flags,
	    }) ]]
	    --[[ lspconfig.svlangserver.setup({
		capabilities = capabilities,
		flags = lsp_flags,
	    }) ]]
	    lspconfig.verible.setup({
		capabilities = capabilities,
		flags = lsp_flags,
        cmd = { 'verible-verilog-ls' },
        format_on_save = true,
	    })
	    --[[ lspconfig.asm_lsp.setup({
		capabilities = capabilities,
		flags = lsp_flags,
	    }) ]]

	    -- local opts = { noremap = true, silent = true}
	    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
	    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
	    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
	    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

	    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
	    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
	end
    }
}
