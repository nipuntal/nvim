return {
  {
    "f4z3r/gruvbox-material.nvim",
    priority = 1000,
    opts = {
      background = {
        transparent = true,
      },
      float = {
        force_background = false,
      },
    },
    config = function(_, opts)
      require("gruvbox-material").setup(opts)
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
