return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-mini/mini.icons", opts = {} },
    },

    init = function()
      local function setup_markdown_buffer(buf)
        if not vim.api.nvim_buf_is_valid(buf) then
          return
        end

        if vim.bo[buf].filetype ~= "markdown" then
          return
        end

        vim.schedule(function()
          if not vim.api.nvim_buf_is_valid(buf) then
            return
          end

          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
          vim.opt_local.breakindent = true
          vim.opt_local.showbreak = "  "
          vim.opt_local.textwidth = 0

          -- Keep raw markdown visible: **bold**, *italic*, etc.
          vim.opt_local.conceallevel = 0
          vim.opt_local.concealcursor = ""

          local map = function(lhs, rhs)
            vim.keymap.set("n", lhs, rhs, {
              buffer = buf,
              silent = true,
              noremap = true,
            })
          end

          map("j", "gj")
          map("k", "gk")
          map("0", "g0")
          map("$", "g$")
        end)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(args)
          setup_markdown_buffer(args.buf)
        end,
      })

      if vim.bo.filetype == "markdown" then
        setup_markdown_buffer(vim.api.nvim_get_current_buf())
      end
    end,

    opts = {
      sign = {
        enabled = false,
      },
      code = {
        conceal_delimiters = false,
      },
    },
  },
}
