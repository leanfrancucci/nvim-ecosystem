" Configuration for codecompanion.
"
" @author Leandro Francucci
lua << EOF
  require("codecompanion").setup({
    prompt_library = {
      ["DoxyFunction"] = {
        strategy = "inline",
        description = "Document a C/C++ function in a buffer",
        opts = {
          is_default = true,
          is_slash_cmd = false,
          modes = { "v" },
          short_name = "doc",
          auto_submit = true,
          user_prompt = false,
        },
        prompts = {
          {
            role = "user",
            content = function(context)
              local fmt = string.format
              local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
              return fmt([[
<user_prompt>
Document the following C/C++ code from buffer %d, following these rules:

1. Identify the language as C or C++.
2. Use Javadoc Style: Uses `/** ... */` comment blocks starting with two asterisks.
3. Use backslash to all Doxygen commands (`\brief`, `\param`, etc.)
5. Don't use `\details` command instead start a new paragraph (blank line).
4. In functions, use [in], [out], and [in,out] attributes to specify data flow direction.
6. Use 80 columns.
7. Use Doxygen command `\c <word>` to refer to a word of code.
8. Here's a comprehensive Doxygen function documentation template following the specifications:
```c
/**
 * \brief Calculates the area of a rectangle
 * 
 * This function multiplies the width and height parameters to calculate
 * the total area of a rectangle. Input validation ensures non-negative values.
 * 
 * \param[in] width  The width of the rectangle (must be >= 0)
 * \param[in] height The height of the rectangle (must be >= 0)
 * \param[out] area  Pointer to store the calculated area result
 * 
 * \return Status code indicating success or failure
 * \retval 0 Success - area calculated successfully
 * \retval -1 Error - invalid input parameters (negative values or null pointer)
 * 
 * \warning Ensure the area pointer is valid before calling this function
 * \note This function performs input validation and will fail on negative dimensions
 */
int calculateRectangleArea(double width, double height, double* area);
```
```%s
%s
```
</user_prompt>
]],
              context.bufnr,
              context.filetype,
              code
            )
            end,
            opts = {
              contains_code = true,
            },
          },
        },
      },
      ["Format"] = {
        strategy = "inline",
        description = "Format C/C++ code in a buffer",
        opts = {
          is_default = true,
          is_slash_cmd = false,
          modes = { "v" },
          short_name = "format",
          auto_submit = true,
          user_prompt = false,
        },
        prompts = {
          {
            role = "user",
            content = function(context)
              local fmt = string.format
              local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
              return fmt([[
<user_prompt>
Format the following C/C++ code from buffer %d, executing these tasks:

1. Identify the language as C or C++.
2. Translate any Spanish comments found in the code to English.
3. Replace non-standard unsigned integer types like `u8T`, `u16T`, `u32T`, `u64T` with their corresponding standard types from `<stdint.h>` (`uint8_t`, `uint16_t`, `uint32_t`, `uint64_t`).
4. Do not include a header file.
5. Convert C++ style comments (`//`) to C style comments (`/* ... */`).
6. If the code has comments, use the following rules to document it:
6.1 Use Doxygen style.
6.1 Use Javadoc Style: Uses `/** ... */` comment blocks starting with two asterisks.
6.2 Use backslash to all Doxygen commands (`\brief`, `\param`, etc.)
6.3 In functions and macros, use [in], [out], and [in,out] attributes to specify data flow direction.
6.4 Don't use `\details` command instead start a new paragraph (blank line).
6.5 Use 80 columns.
6.6 Use Doxygen command `\c <word>` to refer to a word of code.
6.7 Here's a comprehensive Doxygen function documentation template following the specifications:
```c
/**
 * \brief Calculates the area of a rectangle
 * 
 * This function multiplies the width and height parameters to calculate
 * the total area of a rectangle. Input validation ensures non-negative values.
 * 
 * \param[in] width  The width of the rectangle (must be >= 0)
 * \param[in] height The height of the rectangle (must be >= 0)
 * \param[out] area  Pointer to store the calculated area result
 * 
 * \return Status code indicating success or failure
 * \retval 0 Success - area calculated successfully
 * \retval -1 Error - invalid input parameters (negative values or null pointer)
 * 
 * \warning Ensure the area pointer is valid before calling this function
 * \note This function performs input validation and will fail on negative dimensions
 */
int calculateRectangleArea(double width, double height, double* area);
7. Use the following style to define structures and enumerations:
```c
typedef struct <type-name> <type-name>`;
struct <type-name>
{
    ...
};

typedef enum <type-name> <type-name>`;
enum <type-name>
{
    ...
};
```
8. When document structures or enumerations, add a blank line between every fields.
```%s
%s
```
</user_prompt>
]],
              context.bufnr,
              context.filetype,
              code
            )
            end,
            opts = {
              contains_code = true,
            },
          },
        },
      },
      ["Embedded C/C++ Expert"] = {
        strategy = "chat",
        description = "Get some special advice from an LLM",
        opts = {
          index = 11,
          mapping = "<LocalLeader>ne",
          short_name = "cexpert",
          auto_submit = true,
          is_slash_cmd = true,
          is_default = true,
        },
        references = {
          {
            type = "file",
            path = ".clang-format",
          },
        },
        prompts = {
          {
            role = "system",
            content = [[Please follow the following rules for your responses that involve C/C++ code:

1. You carefully provide accurate, factual, thoughtful, nuanced answers, and are brilliant at reasoning. If you think there might not be a correct answer, you say so. Always spend a few sentences
explaining background context, assumptions, and step-by-step thinking BEFORE you try to answer a question. Don't be verbose in your answers, but do provide details and examples where it might help the
explanation.
2. You are an expert software engineer for the C/C++ language on real-time embedded systems.
3. Please adhere strictly to the following rule: Whenever presenting code (C, C++, or any language supported by clang-format), ensure it is formatted according to the style defined in the shared .
clang-format file. This includes indentation, spacing, line breaks, and other stylistic elements described in that configuration file. If necessary, please use clang-format to format it before
presenting to me. Use C style comments.
]],
          },
        },
      },
    },
    interactions = {
        chat = {
            adapter = {
                name = "gemini",
                model = "gemini-3-flash-preview",
            },
            otps = {
                completion_provider = "coc", -- blink|cmp|coc|default
            },
            slash_commands = {
                ["file"] = {
                    opts = {
                        provider = "telescope", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks"
                    },
                },
                ["buffer"] = {
                    opts = {
                        provider = "telescope", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks"
                    },
                },
            },
            keymaps = {
                completion = {
                    modes = {
                        i = "<TAB>",
                    },
                },
            },
        },
    },
    display = {
      action_palette = {
        width = 95,
        height = 10,
        provider = "telescope", -- default|telescope|mini_pick
      },
      diff = {
        enabled = true,
        provider = "mini_diff", -- default|mini_diff
      },
      window = {
        position = "right", -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
      },
    },
    opts = {
        log_level = "TRACE", -- TRACE|DEBUG|ERROR|INFO
    },
  extensions = {
    history = {
      enabled = true,
      opts = {
        -- Keymap to open history from chat buffer (default: gh)
        keymap = "gh",
        -- Keymap to save the current chat manually (when auto_save is disabled)
        save_chat_keymap = "sc",
        -- Save all chats by default (disable to save only manually using 'sc')
        auto_save = true,
        -- Number of days after which chats are automatically deleted (0 to disable)
        expiration_days = 0,
        -- Picker interface (auto resolved to a valid picker)
        picker = "telescope", --- ("telescope", "snacks", "fzf-lua", or "default") 
        ---Optional filter function to control which chats are shown when browsing
        chat_filter = nil, -- function(chat_data) return boolean end
        -- Customize picker keymaps (optional)
        picker_keymaps = {
          rename = { n = "r", i = "<M-r>" },
          delete = { n = "d", i = "<M-d>" },
          duplicate = { n = "<C-y>", i = "<C-y>" },
        },
        ---Automatically generate titles for new chats
        auto_generate_title = true,
        title_generation_opts = {
          ---Adapter for generating titles (defaults to current chat adapter) 
          adapter = nil, -- "copilot"
          ---Model for generating titles (defaults to current chat model)
          model = nil, -- "gpt-4o"
          ---Number of user prompts after which to refresh the title (0 to disable)
          refresh_every_n_prompts = 0, -- e.g., 3 to refresh after every 3rd user prompt
          ---Maximum number of times to refresh the title (default: 3)
          max_refreshes = 3,
          format_title = function(original_title)
              -- this can be a custom function that applies some custom
              -- formatting to the title.
              return original_title
          end
        },
        ---On exiting and entering neovim, loads the last chat on opening chat
        continue_last_chat = false,
        ---When chat is cleared with `gx` delete the chat from history
        delete_on_clearing_chat = false,
        ---Directory path to save the chats
        dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
        ---Enable detailed logging for history extension
        enable_logging = false,

        -- Summary system
        summary = {
          -- Keymap to generate summary for current chat (default: "gcs")
          create_summary_keymap = "gcs",
          -- Keymap to browse summaries (default: "gbs")
          browse_summaries_keymap = "gbs",
          
          generation_opts = {
            adapter = nil, -- defaults to current chat adapter
            model = nil, -- defaults to current chat model
            context_size = 90000, -- max tokens that the model supports
            include_references = true, -- include slash command content
            include_tool_outputs = true, -- include tool execution results
            system_prompt = nil, -- custom system prompt (string or function)
            format_summary = nil, -- custom function to format generated summary e.g to remove <think/> tags from summary
          },
        },
        
        -- Memory system (requires VectorCode CLI)
        memory = {
          -- Automatically index summaries when they are generated
          auto_create_memories_on_summary_generation = true,
          -- Path to the VectorCode executable
          vectorcode_exe = "vectorcode",
          -- Tool configuration
          tool_opts = { 
              -- Default number of memories to retrieve
              default_num = 10 
          },
          -- Enable notifications for indexing progress
          notify = true,
          -- Index all existing memories on startup
          -- (requires VectorCode 0.6.12+ for efficient incremental indexing)
          index_on_startup = false,
        },
      }
    }
  }
})

  local map = vim.keymap.set
  map("n", "<leader>na", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion Actions" })
  map("n", "<leader>nc", "<cmd>CodeCompanionChat<cr>", { desc = "CodeCompanion Chat" })
  map("n", "<leader>nA", "<cmd>CodeCompanionAdd<cr>", { desc = "CodeCompanion Add" })
  map("v", "<leader>ni", "<cmd>CodeCompanion<cr>", { desc = "CodeCompanion Inline" })
  map("n", "<leader>nt", "<cmd>CodeCompanionChat toggle<cr>", { desc = "Toggle Chat" })
EOF
