return {
  {
    "atiladefreitas/dooing",
    config = function()
      require("dooing").setup({
        window = {
          width = 55,
          height = 20,
          border = "rounded",
        },
        quick_keys = false,
        save_path = vim.fn.stdpath("config") .. "/data/dooing_todos.json",
      })
    end,
  },
}
