return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local theme = require("lualine.themes.auto")

      for _, mode in pairs(theme) do
        if type(mode) == "table" then
          for _, section in pairs(mode) do
            if type(section) == "table" then
              section.bg = "none"
            end
          end
        end
      end

      opts.options = opts.options or {}
      opts.options.theme = theme

      return opts
    end,
    init = function()
      local function transparent_statusline()
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "none" })
      end

      transparent_statusline()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = transparent_statusline,
      })
    end,
  },
}
