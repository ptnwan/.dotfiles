--[[ return {
    {
	'nvim-telescope/telescope.nvim',
	--tag = '0.1.5',
	branch = "0.1.x",
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
	    local builtin = require('telescope.builtin')
	    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy find file in cwd" })
	    vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "Find string in cwd" })
	    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Fuzzy find file in buffers" })
	    vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
	end
    },
    {
	'nvim-telescope/telescope-ui-select.nvim',
	config = function()
	    local telescope = require("telescope")
	    local actions = require("telescope.actions")
	    telescope.setup({
		defaults = {
		    path_display = { "smart" },
		    mappings = {
			i = {
			    ["<C-k>"] = actions.move_selection_previous, -- move to prev result
			    ["<C-j>"] = actions.move_selection_next, -- move to next result
			    ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		    },
		},
		extensions = {
		    ["ui-select"] = {
			require("telescope.themes").get_dropdown {
			    -- even more opts
			}

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		    }
		}
	    })
	    -- To get ui-select loaded and working with telescope, you need to call
	    -- load_extension, somewhere after setup function:
	    require("telescope").load_extension("ui-select")
	end
    }
} ]]

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
	"nvim-lua/plenary.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-tree/nvim-web-devicons",
    },
    config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local builtin = require('telescope.builtin')

	telescope.setup({
	    defaults = {
		path_display = { "smart" },
		mappings = {
		    i = {
			["<C-k>"] = actions.move_selection_previous, -- move to prev result
			["<C-j>"] = actions.move_selection_next, -- move to next result
			["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-d>"] = actions.delete_buffer,
		    },
		},
	    },
	})

	telescope.load_extension("fzf")

	-- set keymaps
	local keymap = vim.keymap -- for conciseness

	keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy find file in cwd" })
	keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
	keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "Find string in cwd" })
	keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Fuzzy find file in buffers" })
	keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
    end,
}
