local pattern = "%(stdin%):(%d+):(%d+):%s*([%u%d]+)%s+(.+)"
local groups = { "lnum", "col", "code", "message" }
local defaults = { ["source"] = "mado", ["severity"] = vim.diagnostic.severity.WARN }

return {
  cmd = "mado",
  args = { "check", "--quiet" },
  stdin = true,
  stream = "stdout",
  ignore_exitcode = true,
  parser = require("lint.parser").from_pattern(pattern, groups, nil, defaults),
}
