local M = {} -- Create a module table
M.create_dated_file = function()
  local fzf = require("fzf-lua")
  local vim = vim

  -- Function to format the current date as YYYY-MM-DD
  local function get_current_date()
    return vim.fn.strftime("%Y-%m-%d")
  end

  -- Function to create a new file with the date as the filename
  local function create_file(directory)
    local date_string = get_current_date()
    local filepath = vim.fn.expand(directory .. "/" .. date_string .. ".md") 
    vim.cmd("edit" .. filepath)
  end

  -- Use fzf to select a directory
  fzf.files({
    prompt = "Select directory: ",
    cmd = "find /tmp/fml/ -type d",
    actions = {
      ["enter"] = function(files)
        if #files > 0 then
          create_file(files[1])
        end
      end,
    },

    -- Optional: configure fzf options as needed
     fzf_opts = {
      -- ["--type"] = "directory",
      -- ["--layout"] = "reverse",
     },
  })
end
return M
