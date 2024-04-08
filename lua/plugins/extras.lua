return {
  -- Hihglight colors
  {
    "echasnovski/mini.hipatterns",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  -- Autotags
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- delete buffer
  {
    "famiu/bufdelete.nvim",
    event = "VeryLazy",
    config = function()
      vim.keymap.set(
        "n",
        "Q",
        ":lua require('bufdelete').bufdelete(0, false)<cr>",
        { noremap = true, silent = true, desc = "Delete buffer" }
      )
    end,
  },

  -- comments
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    lazy = false,
  },
  -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
  { "joosepalviste/nvim-ts-context-commentstring", lazy = true },

  -- Neovim plugin to improve the default vim.ui interfaces
  {
    "stevearc/dressing.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    config = function()
      require("dressing").setup()
    end,
  },

  -- Neovim notifications and LSP progress messages
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
    enabled = false,
    config = function()
      require("fidget").setup({
        window = { blend = 0 },
      })
    end,
  },

  -- Smooth scrolling neovim plugin written in lua
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        stop_eof = true,
        easing_function = "sine",
        hide_cursor = true,
        cursor_scrolls_alone = true,
      })
    end,
  },

  -- find and replace
  {
    "windwp/nvim-spectre",
    event = "BufRead",
  },

  -- Add/change/delete surrounding delimiter pairs with ease
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- Heuristically set buffer options
  {
    "tpope/vim-sleuth",
  },

  -- Neovim Lua plugin to automatically manage character pairs. Part of 'mini.nvim' library.
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  -- -- Indent guide for Neovim
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = { "BufReadPost", "BufNewFile" },
  --   enabled = false,
  --   version = "2.1.0",
  --   opts = {
  --     char = "┊",
  --     -- char = "│",
  --     filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
  --     show_trailing_blankline_indent = false,
  --     show_current_context = false,
  --   },
  -- },

  -- Enhanced f/t motions for Leap
  {
    "ggandor/flit.nvim",
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs({ "f", "F", "t", "T" }) do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
  -- mouse replacement
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },

  -- breadcrumbs
  {
    "LunarVim/breadcrumbs.nvim",
    config = function()
      require("breadcrumbs").setup()
    end,
  },

  -- Simple winbar/statusline plugin that shows your current code context
  {
    "SmiteshP/nvim-navic",
    config = function()
      local icons = require("config.icons")
      require("nvim-navic").setup({
        highlight = true,
        lsp = {
          auto_attach = true,
          preference = { "typescript-tools" },
        },
        click = true,
        separator = " " .. icons.ui.ChevronRight .. " ",
        depth_limit = 0,
        depth_limit_indicator = "..",
        icons = {
          File = " ",
          Module = " ",
          Namespace = " ",
          Package = " ",
          Class = " ",
          Method = " ",
          Property = " ",
          Field = " ",
          Constructor = " ",
          Enum = " ",
          Interface = " ",
          Function = " ",
          Variable = " ",
          Constant = " ",
          String = " ",
          Number = " ",
          Boolean = " ",
          Array = " ",
          Object = " ",
          Key = " ",
          Null = " ",
          EnumMember = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        },
      })
    end,
  },

  -- persist sessions
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {},
  },

  -- better code annotation
  {
    "danymat/neogen",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local neogen = require("neogen")

      neogen.setup({
        snippet_engine = "luasnip",
      })
    end,
    -- version = "*"
  },

  -- {
  --   "ThePrimeagen/refactoring.nvim",
  --   enabled = false,
  --   dependencies = {
  --     { "nvim-lua/plenary.nvim" },
  --     { "nvim-treesitter/nvim-treesitter" },
  --   },
  --   config = function()
  --     require("refactoring").setup({})
  --   end,
  -- },
  --better TS error messages
  { "dmmulroy/ts-error-translator.nvim", event = { "BufReadPre", "BufNewFile" } },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000,
      background_colour = "#000000",
      render = "wrapped-compact",
    },
  },
  -- line highlighting
  {
    "shellRaining/hlchunk.nvim",
    opts = { blank = { enable = false }, chunk = { chars = { right_arrow = "─" } }, line_num = { enable = false } },
  },
  -- -- filename
  -- {
  --   "b0o/incline.nvim",
  --   dependencies = {},
  --   event = "BufReadPre",
  --   priority = 1200,
  --   config = function()
  --     local helpers = require("incline.helpers")
  --     require("incline").setup({
  --       window = {
  --         padding = 0,
  --         margin = { horizontal = 0 },
  --       },
  --       render = function(props)
  --         local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
  --         local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
  --         local modified = vim.bo[props.buf].modified
  --         local buffer = {
  --           ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
  --           " ",
  --           { filename, gui = modified and "bold,italic" or "bold" },
  --           " ",
  --           guibg = "#363944",
  --         }
  --         return buffer
  --       end,
  --     })
  --   end,
  -- },
}
