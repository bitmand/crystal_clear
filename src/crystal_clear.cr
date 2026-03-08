require "./color"
require "./spinner"
require "./terminal"

# TODO: Write documentation for `CrystalClear`
module CrystalClear
  VERSION = "0.2.2"

  # ansi characters
  ESC = "\e["             # escape
  ESC_RESET = ESC + "0m"  # reset
end
