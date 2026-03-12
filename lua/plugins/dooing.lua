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

        formatting = {
          pending = {
            icon = "☐",
            format = { "icon", "notes_icon", "text", "due_date", "ect" },
          },
          in_progress = {
            icon = "▣",
            format = { "icon", "text", "due_date", "ect" },
          },
          done = {
            icon = "☒",
            format = { "icon", "notes_icon", "text", "due_date", "ect" },
          },
        },
      })
    end,
  },
}
