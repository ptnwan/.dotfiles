return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
	    ensure_installed = {
		"lua",
		"python",
		"c",
		"matlab",
		"markdown",
		"verilog",
	    },
	    sync_install = false,
	    highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	    },
	    indent = {
		enable = true,
		disable = {},
	    },
	    incremental_selection = {
		enable = true,
		keymaps = {
		    init_selection = "<C-space>",
		    node_incremental = "<C-space>",
		    scope_incremental = false,
		    node_decremental = "<bs>",
		},
	    },
	})
    end,
}
