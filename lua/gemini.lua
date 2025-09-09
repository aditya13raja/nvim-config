-- Gemini CLI Integration for Neovim (WSL2 stdin Fix)

-- Helper function to get the text from the current visual selection
local function get_visual_selection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.api.nvim_buf_get_text(0, start_pos[2] - 1, start_pos[3] - 1, end_pos[2] - 1, end_pos[3], {})
  return table.concat(lines, "\n")
end

-- Main function to query the Gemini CLI and handle the output
local function query_gemini(prompt_text, output_handler)
  -- IMPORTANT: Replace 'gemini' with your actual CLI command if it's different.
  -- This approach uses a shell pipe (`|`), which is more robust in WSL.
  local escaped_prompt = vim.fn.shellescape(prompt_text)
  local command_string = "echo " .. escaped_prompt .. " | gemini"

  -- Execute the full command string via the shell.
  vim.system({"sh", "-c", command_string}, function(result)
    -- Schedule the entire callback to run on the main loop to prevent UI errors.
    vim.schedule(function()
      if result.code ~= 0 then
        local errmsg = "Gemini CLI Error: " .. (result.stderr or "Unknown error")
        vim.api.nvim_echo({{errmsg, "ErrorMsg"}}, true, {})
        return
      end
      output_handler(result.stdout)
    end)
  end)
end

-- Output handler to display text in a new vertical split
local function display_in_new_split(output)
  vim.cmd('vnew')
  vim.api.nvim_buf_set_option(0, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(0, 'buftype', 'nofile')
  vim.bo.filetype = 'markdown'
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n"))
end

-- Output handler to replace the current visual selection
local function replace_selection(output)
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  vim.api.nvim_buf_set_text(0, start_pos[2] - 1, start_pos[3] - 1, end_pos[2] - 1, end_pos[3], vim.split(output, "\n"))
end

-- Keymap for asking a general question in normal mode
vim.keymap.set('n', '<leader>ga', function()
  vim.ui.input({ prompt = 'Ask Gemini: ' }, function(input)
    if input and input ~= "" then
      query_gemini(input, display_in_new_split)
    end
  end)
end, { noremap = true, silent = true, desc = "Ask Gemini a question" })

-- Keymap for refactoring selected code in visual mode
vim.keymap.set('v', '<leader>gr', function()
  local selection = get_visual_selection()
  if selection == "" then
    vim.api.nvim_echo({{"No text selected.", "WarningMsg"}}, false, {})
    return
  end
  local prompt = "Refactor the following code:\n\n" .. selection
  query_gemini(prompt, replace_selection)
end, { noremap = true, silent = true, desc = "Refactor selection with Gemini" })

-- Keymap to explain selected code
vim.keymap.set('v', '<leader>ge', function()
  local selection = get_visual_selection()
  if selection and selection ~= "" then
    local prompt = "Explain the following code:\n\n" .. selection
    query_gemini(prompt, display_in_new_split)
  end
end, { noremap = true, silent = true, desc = "Explain selection with Gemini" })

-- Confirmation message
vim.api.nvim_echo({{"Gemini keymaps loaded. Use <leader>ga, <leader>gr, and <leader>ge."}}, false, {})
