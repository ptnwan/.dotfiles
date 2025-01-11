--[[ return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
	local highlight = {
	    "custom1",
	    "custom2",
	    "custom3",
	}
	local hooks = require "ibl.hooks"
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	    vim.api.nvim_set_hl(0, "custom1", { fg = '#74C7EC'})
	    vim.api.nvim_set_hl(0, "custom2", { fg = '#94e2d5'})
	    vim.api.nvim_set_hl(0, "custom3", { fg = '#a6e3a1'})
	end)
	require("ibl").setup({
	    indent = {
	      smart_indent_cap = true,
	    },
	    scope = {
	      enabled = true,
	      show_start = false,
	      show_end = false,
	      highlight = highlight,
	    },
	})
    end
} ]]

return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
	    indent = { char = "|", smart_indent_cap = true, },
	    scope = {
	        enabled = true,
	        show_start = false,
	        show_end = false,
	    },
    },
}
