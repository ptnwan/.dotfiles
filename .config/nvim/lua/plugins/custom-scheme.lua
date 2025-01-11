return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha 
                background = { -- :h background 
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false,
                term_colors = false,
                dim_inactive = {
                    enabled = false,
                    shade = "dark",
                    percentage = 0.15,
                },
                no_italic = false, -- Force no italic
                no_bold = false, -- Force no bold
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    loops = { "bold" },
                    functions = { "bold" },
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                color_overrides = {},
                custom_highlights = {},
                integrations = {
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                    mason = true,
                    cmp = true,
                    gitsigns = false,
                    nvimtree = false,
                    notify = false,
                    mini = false,
                    neotree = true,
                    telescope = {
                        enabled = true,
                    },
                    treesitter = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                            ok = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                            ok = { "underline" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                    indent_blankline = {
                        enabled = true,
                        scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
                        colored_indent_levels = true,
                    },
                },
            })
        end
    },
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        lazy = false,
        priority = 1000,
        config = function ()
            require("tokyonight").setup({
                style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
                light_style = "day", -- The theme is used when the background is set to light
                transparent = false, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
                day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                dim_inactive = false, -- dims inactive windows
                lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
            })
        end
    },
    {
        "tiagovla/tokyodark.nvim",
        name = "tokyodark",
        lazy = false,
        priority = 1000,
    },
}
