return {
    {
	"hrsh7th/cmp-nvim-lsp"
    },
    {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	dependencies = {
	    "saadparwaiz1/cmp_luasnip",
	    "rafamadriz/friendly-snippets"
	},
	-- build = "make install_jsregexp"
    },
    {
	'hrsh7th/nvim-cmp',
	config = function()
	    local cmp = require("cmp")
	    require("luasnip.loaders.from_vscode").lazy_load()
	    cmp.setup({
		snippet = {
		    expand = function(args)
			require("luasnip").lsp_expand(args.body)
		    end,
		},
		window = {
		    documentation = cmp.config.window.bordered( "╭", "─", "╮", "│", "╯", "─", "╰", "│" ),
		    completion = cmp.config.window.bordered( "╭", "─", "╮", "│", "╯", "─", "╰", "│" ),
		},
		mapping = cmp.mapping.preset.insert({
		    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
		    ['<C-f>'] = cmp.mapping.scroll_docs(4),
		    ['<C-Space>'] = cmp.mapping.complete(),
		    ['<C-e>'] =  cmp.mapping.abort(),
		    ['<CR>'] = cmp.mapping.confirm({ select = true }),
		    ["<Tab>"] = function(fallback)
			if cmp.visible() then
			    cmp.select_next_item()
			elseif require("luasnip").expandable() then
			    require("luasnip").expand()
			elseif require("luasnip").expand_or_jumpable() then
			    require("luasnip").expand_or_jump()
			-- elseif check_backspace() then
			--     fallback()
			else
			    fallback()
			end
		    end,
		    ["<S-Tab>"] = function(fallback)
			if cmp.visible() then
			    cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
			    require("luasnip").jump(-1)
			else
			    fallback()
			end
		    end,
		}),
		sources = cmp.config.sources({
		    { name = 'nvim_lsp' },
		    { name = 'luasnip' },
		}, {
			{ name = 'buffer' },
		    })
	    })
	end
    }
}
