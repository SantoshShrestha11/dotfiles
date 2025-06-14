-- lua/plugins/rose-pine.lua
return {
  -- "rose-pine/neovim",
  "catppuccin/nvim",
  lazy = false,   -- Ensure the theme is loaded immediately
  priority = 1000, -- High priority to load the theme early
  opts = {
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      dashboard = true,
      flash = true,
      fzf = true,
      grug_far = true,
      gitsigns = true,
      headlines = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      leap = true,
      lsp_trouble = true,
      mason = true,
      markdown = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      navic = { enabled = true, custom_bg = "lualine" },
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      semantic_tokens = true,
      snacks = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
  },
  config = function()
    -- Configure the rose-pine theme
    require("catppuccin").setup({
      disable_background = true, -- Start with a transparent background
      disable_float_background = false,
      bold_vert_split = false,
    })

    -- Apply the colorscheme
    vim.cmd.colorscheme("catppuccin")

    -- Background transparency toggle
    local bg_transparent = true

    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      if bg_transparent then
        -- Enable transparent background
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      else
        -- Disable transparent background
        vim.api.nvim_set_hl(0, "Normal", { bg = nil })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })
      end
    end

    -- Map a key to toggle transparency
    vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
  end,
}
