-- lua/plugins/colorscheme.lua
return {
  -- "rose-pine/neovim",
  'catppuccin/nvim',
  lazy = false, -- Ensure the theme is loaded immediately
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
          errors = { 'undercurl' },
          hints = { 'undercurl' },
          warnings = { 'undercurl' },
          information = { 'undercurl' },
        },
      },
      navic = { enabled = true, custom_bg = 'lualine' },
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
    -- Configure the catppuccin theme
    require('catppuccin').setup {
      transparent_background = false, -- Start with solid background (better for toggle)
      disable_float_background = false,
      bold_vert_split = false,
    }

    -- Apply the colorscheme
    vim.cmd.colorscheme 'catppuccin'

    -- Background transparency toggle
    local bg_transparent = false -- Start with solid background
    local original_normal_bg = nil
    local original_float_bg = nil

    local toggle_transparency = function()
      bg_transparent = not bg_transparent

      if bg_transparent then
        -- Store original backgrounds before making transparent
        if original_normal_bg == nil then
          local normal_hl = vim.api.nvim_get_hl(0, { name = 'Normal' })
          local float_hl = vim.api.nvim_get_hl(0, { name = 'NormalFloat' })
          original_normal_bg = normal_hl.bg
          original_float_bg = float_hl.bg
        end

        -- Enable transparent background
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
        print 'Transparency enabled'
      else
        -- Restore original backgrounds
        vim.api.nvim_set_hl(0, 'Normal', { bg = original_normal_bg })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = original_float_bg })
        print 'Transparency disabled'
      end
    end

    -- Map a key to toggle transparency
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true, desc = 'Toggle background transparency' })
  end,
}
