" Configuration for codecompanion.
"
" @author Leandro Francucci

lua << EOF
  require("codecompanion").setup({
    display = {
      action_palette = {
        width = 95,
        height = 10,
        prompt = "Prompt ", -- Prompt used for interactive LLM calls
        provider = "telescope", -- default|telescope|mini_pick
        opts = {
          show_default_actions = true, -- Show the default actions in the action palette?
          show_default_prompt_library = true, -- Show the default prompt library in the action palette?
        },
      },
    },
    strategies = {
      chat = {
        adapter = "gemini",
        slash_commands = {
            ["file"] = {
                -- Location to the slash command in CodeCompanion
                callback = "strategies.chat.slash_commands.file",
                description = "Select a file using Telescope",
                opts = {
                    provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
                    contains_code = true,
                },
            },
            ["buffer"] = {
                -- Location to the slash command in CodeCompanion
                callback = "strategies.chat.slash_commands.buffer",
                description = "Select a file using Telescope",
                opts = {
                    provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
                    contains_code = true,
                },
            },
        },
      },
      inline = {
        adapter = "gemini",
        keymaps = {
          accept_change = {
            modes = { n = "<leader>a" },
          },
          reject_change = {
            modes = { n = "<leader>r" },
          },
        },
      },
    },
  })

  local function map(mode, lhs, rhs, opts)
    local options = { noremap=true, silent=true }
    if opts then
      options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
  
  map('n', '<leader>na', ':CodeCompanionActions<CR>')
  map('n', '<leader>nc', ':CodeCompanionChat<CR>')
  map('n', '<leader>nA', ':CodeCompanionAdd<CR>')
  map('n', '<leader>ni', ':CodeCompanion<CR>')
EOF
