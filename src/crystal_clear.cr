require "./color"
require "./spinner"
require "./terminal"
require "./hyperlink"

# TODO: Write documentation for `CrystalClear`
module CrystalClear
  VERSION = "0.3.0"

  # escape sequences
  # https://en.wikipedia.org/wiki/ANSI_escape_code#Fe_Escape_sequences
  ESC = "\e"          # escape
  ESC_CSI = "\e["     # control sequence introducer
  ESC_ST = "\e\\"     # string terminator
  ESC_OSC = "\e]"     # operating system command

  # control sequence introducers
  CSI_RESET = ESC_CSI + "0m"  # reset

  # operating system commands - ends with BEL (\a) or ST )
  #OSC_0   Set window title: ESC ] 0 ; [title] \a
  #OSC_4   Set or report foreground/background colors:
  OSC_8 = ESC_OSC + "8"   # Hyperlinks
  #OSC_9   System notification (iTerm2 variant): ESC ] 9 ; [message] \a
  #OSC_50  Set the cursor shape: ESC ] 50 ; CursorShape=[0|1|2] \a
  #OSC_52  Clipboard copy operation: ESC ] 52 ; c ; [base64 data] \a
end
