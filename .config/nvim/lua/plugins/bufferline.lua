return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    after = "catppuccin",
    config  = function()
	local bufferline = require("bufferline")

	local colors = {
	    red = '#f38ba8',
	    blue = "#89B4FA",
	}

	bufferline.setup({
	    options = {
		mode = "tabs",
		separator_style = "slope",
		indicator = {
		    style = "underline"
		},
		buffer_close_icon = '',
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icon = false,
		show_close_icon = false,
		show_tab_indicators = true,
		enforce_regular_tabs = true,

		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level)
		    local icon = level:match("error") and " " or ""
		    return " " .. icon .. count
		end,

		offsets = {
		    {
			filetype = "neo-tree",
			text = "File Manager",
			highlight = "Directory",
			text_align = "center"
		    }
		},
	    },
	    highlights = require("catppuccin.groups.integrations.bufferline").get()
	    --[[ highlights = {
		buffer_selected = {
		    fg = colors.blue,
		    sp = colors.blue,
		},
		info_selected = {
		    sp = colors.blue,
		},
		info_diagnostic_selected = {
		    sp = colors.blue,
		},
		tab_selected = {
		    sp = colors.blue,
		},
		tab_separator_selected = {
		    sp = colors.blue,
		},
		separator_selected = {
		    sp = colors.blue,
		},
		indicator_selected = {
		    sp = colors.blue,
		},
		close_button_selected = {
		    fg = colors.blue,
		    sp = colors.blue,
		},
		error_selected = {
		    sp = colors.blue,
		},
		error_diagnostic_selected = {
		    sp = colors.blue,
		},
		pick_selected = {
		    sp = colors.blue,
		},
	    }, ]]
	})
    end,
}
