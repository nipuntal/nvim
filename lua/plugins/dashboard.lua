return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      local function dedent(str)
        local lines = vim.split(str, "\n", { plain = true })

        while #lines > 0 and vim.trim(lines[1]) == "" do
          table.remove(lines, 1)
        end
        while #lines > 0 and vim.trim(lines[#lines]) == "" do
          table.remove(lines)
        end

        local min_indent = math.huge
        for _, line in ipairs(lines) do
          if vim.trim(line) ~= "" then
            local indent = #(line:match("^%s*") or "")
            min_indent = math.min(min_indent, indent)
          end
        end

        if min_indent == math.huge then
          min_indent = 0
        end

        for i, line in ipairs(lines) do
          lines[i] = line:sub(min_indent + 1)
        end

        return table.concat(lines, "\n")
      end

      opts.dashboard = opts.dashboard or {}
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.formats = opts.dashboard.formats or {}
      opts.styles = opts.styles or {}
      opts.styles.dashboard = opts.styles.dashboard or {}
      opts.styles.dashboard.wo = opts.styles.dashboard.wo or {}

      opts.styles.dashboard.wo.wrap = true

      opts.dashboard.formats.icon = function(item)
        if item.file or item.dir then
          return { "  ", width = 2 }
        end
        return { item.icon or "", width = 2 }
      end

      opts.dashboard.preset.header = dedent([=[
        YOUR ASCII ART HERE
      ]=])
      opts.dashboard.preset.header = [=[




      
                .<]*..+]]~     -[}}}}}}}=   ~}}}}}}}}}}}}}*    :]}}}}}}}*         -}}}}}]-     -]}}}}}}}>   ~[}}<  +}}}}}[.~[}}}}}}}*                 
               ><. ~[}^  +<  -]}}}}()[}}}}<-~}}}}]]]]]]}}}}) -[}}}}()[}}}})- :----=]]((((>   :[}}}}(<]}}}}[=~[}}[[}}}}[^.-}}}}})<]}}}}]~              
              *>=)<<}}]>)^^).(}}[~    :<}}}]~}}}<      .}}}[.)}}[=    .^}}}[ -<}}}}})-       )}}[=     *}}}]=[}}}}}[*.  .(}}[~     ^}}})              
              <=}}})~<+}}}^[-}}}<       }}}]~}}}[=          ~}}}<       [}}[    :]}}}}}(    -[}}>      .)}}]=[}}}[      =[}}>      :(}})              
              ^> +~<}}]~*-+).]}}]:      }}}<.^}}}}}):       :(}}(:      [}})=}}}<  =]}}}}}= .)}}]-     .)}}(.*}}}}}[+   :]}}(:     :(}}<              
               <<   =<   +)  =[}}})^^<+ }}}]~}}}}}}}}[>      ~[}}})^^<^ [}}[-[}}}(<<<]}}}}}[ -[}}}(>><<.)}}]=[}}[[}}}}(+ -}}}}(>><<:(}})              
                :<]*:-=(]~     +}}}}}}}(}}}] .... :]}}}}[=     =}}}}}}}[[}}[ =}}}}}}}}}}}}}[   ~[}}}}}}[]}}]..... .*}}}}}].=[}}}}}}[[}})              
        





      ]=]

      opts.dashboard.sections = {
        { section = "header", align = "center", padding = { 1, 1 } },
        {
          title = "Recent Files",
          section = "recent_files",
          indent = 0,
          limit = 2,
          padding = { 1, 2 },
        },
        { section = "keys", gap = 2, padding = { 1, 0 } },
      }

      opts.dashboard.preset.keys = {
        {
          key = "p",
          desc = "Projects",
          action = ":lua Snacks.dashboard.pick('projects')",
        },
        {
          key = "k",
          desc = "Edit Keybinds",
          action = ":edit ~/.config/nvim/lua/config/keymaps.lua",
        },
        {
          key = "c",
          desc = "Config",
          action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
        },
      }

      return opts
    end,
  },
}
