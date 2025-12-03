-- TODO: Capture 'error' severity that does not include '[code]' at the end
local pattern = "([^:]+):(%d+):(%d+):%s(.+):%s(.+)%s%[([%l_]+)%]"
local groups = { "file", "lnum", "col", "severity", "message", "code" }
local defaults = { ["source"] = "mh_lint" }

local severity_map = {
  ["error"] = vim.diagnostic.severity.ERROR,
  ["check (high)"] = vim.diagnostic.severity.WARN,
  ["check (medium)"] = vim.diagnostic.severity.INFO,
  ["check (low)"] = vim.diagnostic.severity.HINT,
}

return {
  cmd = "mh_lint",
  args = { "--brief" },
  stdin = false,
  stream = "stdout",
  ignore_exitcode = true,
  parser = require("lint.parser").from_pattern(pattern, groups, severity_map, defaults),
}
