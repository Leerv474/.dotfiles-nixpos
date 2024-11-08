return {
  "saghen/blink.cmp",
  lazy = false,
  dependencies = {
    "rafamadriz/friendly-snippets",
    "saghen/blink.compat",
  },

  version = "v0.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "enter" },

    highlight = {
      use_nvim_cmp_as_default = true,
    },
    nerd_font_variant = "mono",

    -- experimental auto-brackets support
    -- accept = { auto_brackets = { enabled = true } }

    -- experimental signature help support
    trigger = { signature_help = { enabled = true } },
    --
    sources = {
      -- list of enabled providers
      completion = {
        enabled_providers = { "lsp", "path", "snippets", "buffer", "vim-dadbod-completion" },
      },

      -- Please see https://github.com/Saghen/blink.compat for using `nvim-cmp` sources
      providers = {
        dadbod = {
          name = "vim-dadbod-completion",
          module = "blink.compat.source",
          score = 5,
        },
        lsp = {
          name = "LSP",
          module = "blink.cmp.sources.lsp",

          --- *All* of the providers have the following options available
          --- NOTE: All of these options may be functions to get dynamic behavior
          --- See the type definitions for more information
          enabled = true, -- whether or not to enable the provider
          transform_items = nil, -- function to transform the items before they're returned
          should_show_items = true, -- whether or not to show the items
          max_items = nil, -- maximum number of items to return
          min_keyword_length = 0, -- minimum number of characters to trigger the provider
          fallback_for = {}, -- if any of these providers return 0 items, it will fallback to this provider
          score_offset = 4, -- boost/penalize the score of the items
          override = nil, -- override the source's functions
        },
        path = {
          name = "Path",
          module = "blink.cmp.sources.path",
          score_offset = 1,
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
            end,
            show_hidden_files_by_default = false,
          },
        },
        snippets = {
          name = "Snippets",
          module = "blink.cmp.sources.snippets",
          score_offset = 3,
          opts = {
            friendly_snippets = true,
            search_paths = { vim.fn.stdpath("config") .. "/snippets" },
            global_snippets = { "all" },
            extended_filetypes = {},
            ignored_filetypes = {},
          },
        },
        buffer = {
          name = "Buffer",
          module = "blink.cmp.sources.buffer",
          fallback_for = { "lsp" },
        },
      },
    },

    windows = {
      autocomplete = {
        min_width = 15,
        max_height = 10,
        border = "none",
        winblend = 0,
        winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
        scrolloff = 2,
        scrollbar = true,
        direction_priority = { "s", "n" },
        auto_show = true,
        selection = "auto_insert",
        draw = "simple",
        cycle = {
          from_bottom = true,
          from_top = true,
        },
      },
      documentation = {
        min_width = 10,
        max_width = 60,
        max_height = 20,
        border = "padded",
        winblend = 0,
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        -- note that the gutter will be disabled when border ~= 'none'
        scrollbar = true,
        direction_priority = {
          autocomplete_north = { "e", "w", "n", "s" },
          autocomplete_south = { "e", "w", "s", "n" },
        },
        -- Controls whether the documentation window will automatically show when selecting a completion item
        auto_show = false,
        auto_show_delay_ms = 500,
        update_delay_ms = 50,
      },
      signature_help = {
        min_width = 1,
        max_width = 100,
        max_height = 10,
        border = "padded",
        winblend = 0,
        winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
        -- note that the gutter will be disabled when border ~= 'none'
        scrollbar = false,

        -- which directions to show the window,
        -- falling back to the next direction when there's not enough space
        direction_priority = { "n", "s" },
      },
      ghost_text = {
        enabled = false,
      },
    },
  },
}
