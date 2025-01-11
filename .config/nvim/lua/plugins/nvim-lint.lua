return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile", },
    config = function()
    	local lint = require("lint");
	lint.linters_by_ft = {
	    python = { "ruff" },
	    c = { "cpplint" },
	    cpp = { "cpplint" },
	}
	local lint_autogroup = vim.api.nvim_create_augroup("lint", {clear = true})
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	    pattern = { "*.py", "*.c" },
	    group = lint_autogroup,
	    callback = function()
	    	lint.try_lint()
	    end
	})
	vim.keymap.set("n", "<leader>l", function()
	    lint.try_lint()
	end)
    end,
}
