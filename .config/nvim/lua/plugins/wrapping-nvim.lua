return {
    --[[ "andrewferrier/wrapping.nvim",
    config = function()
	local opts = {
	    softener = { "markdown" },
	    auto_set_mode_filetype_allowlist = {
	        "asciidoc",
	        "gitcommit",
	        "latex",
	        "mail",
	        "rst",
	        "tex",
	        "text",
	    },
	}
    	require("wrapping").setup(opts)
    end, ]]
}
