-- TODO: Handle error case 'Error: error: invalid package file'.

local pattern = "^(%S+)%s+%([^)]*%)%s+([IEW]):%s+(.*)$"
local groups = { "file", "severity", "message" }
local severities = {
  E = vim.diagnostic.severity.ERROR,
  W = vim.diagnostic.severity.WARN,
  I = vim.diagnostic.severity.INFO,
}

return {
  cmd = "namcap",
  stdin = false,
  stream = "stdout",
  ignore_exitcode = false,
  args = { "--info" },
  parser = require("lint.parser").from_pattern(pattern, groups, severities, { ["source"] = "namcap" }),
}
