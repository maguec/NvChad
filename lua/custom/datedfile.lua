local M = {} -- Create a module table
M.create_dated_file = function()
  local fzf = require("fzf-lua")
  local vim = vim

  -- vim chdir doesn't work correctly with  ~
  local function expand_tilde(path)
  if not path then return nil end -- Handle nil input

  if string.sub(path, 1, 1) == "~" then
    local home_dir = vim.loop.os_homedir()
    if home_dir then
      if string.len(path) == 1 then --just a tilde
        return home_dir
      else
        return string.gsub(path, "^~", home_dir)
      end
    else
      return path -- Return the original path if home directory retrieval fails
    end
  else
    return path -- Return the original path if it doesn't start with ~
  end
end

  -- Function to format the current date as YYYY-MM-DD
  local function get_current_date()
    return vim.fn.strftime("%Y-%m-%d")
  end

  -- Remove all of the leading character until we start the filepath
  local function remove_until_fp(str)
    local slash_pos = string.find(str, "/")
    local tilde_pos = string.find(str, "~")
  
    local pos = nil
  
    if slash_pos and tilde_pos then
      pos = math.min(slash_pos, tilde_pos)
    elseif slash_pos then
      pos = slash_pos
    elseif tilde_pos then
      pos = tilde_pos
    end
  
    if pos then
      return string.sub(str, pos)
    else
      return str -- Return the original string if neither / nor ~ is found
    end
  end

  -- Function to create a new file with the date as the filename
  local function create_file(directory)
    local date_string = get_current_date()
    directory = expand_tilde(remove_until_fp(directory))
    local fp = directory .. "/" .. date_string .. ".md"
    local ok, err = os.execute("mkdir -p " .. directory)
    if not ok then
      vim.notify("Mkdir failed: " .. err)
    end
    local ok2, err2 = vim.loop.chdir(directory)
    if not ok2 then
      vim.notify(directory)
      vim.notify("Chdir failed: " .. err2)
    end
    local filepath = vim.fn.expand(fp)
    vim.cmd("edit" .. filepath)
  end

  -- Use fzf to select a directory
  fzf.files({
    prompt = "Select directory: ",
    cmd = "find ~/Code/Google/VimWiki/Customers/ -type d",
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
