-- TODO: Implement
local defaults = { ["source"] = "mh_style" }

return {
  cmd = "mh_style",
  args = {},
  stdin = false,
  stream = "stdout",
  ignore_exitcode = true,
  parser = require("lint.parser").from_pattern(nil, nil,nil, defaults),
}
