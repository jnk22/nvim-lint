-- TODO: Get code.

return {
  cmd = "cmake-lint",
  args = { "--suppress-decorations" },
  stdin = false,
  ignore_exitcode = true,
  parser = require("lint.parser").from_errorformat("%f:%l: %m", {
    source = "cmake-lint",
    severity = vim.diagnostic.severity.WARN,
  }),
}
