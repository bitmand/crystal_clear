module CrystalClear
  struct Color
    SCHEMES = {
      # 16 original 4-bit colors
      std: %w{0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15},
      # 12 grayscale colors (light -> dark)
      gray: %w{254 252 250 248 246 244 242 240 238 236 234 232},
      # 18 dark colors
      dark: %w{124 130 136 142 106 070 034 035 036 037 031 025 019 055 091 127 126 125},
      # 18 bright colors
      bright: %w{196 208 214 226 154 082 046 049 050 051 039 033 021 057 129 165 199 197},
      # 18 light colors
      light: %w{210 216 222 228 192 156 120 121 122 123 117 111 105 141 177 213 212 211},
      # 18 pastel colors
      pastel: %w{167 173 179 185 149 113 077 078 079 080 074 068 062 098 134 170 169 168},
    }

    # set foreground (text) color
    def Color.ansi_fg(color : String) : String
      ESC + "38;5;%sm" % color
    end

    # set background color
    def Color.ansi_bg(color : String) : String
      ESC + "48;5;%sm" % color
    end

    # print foreground/background ansi color codes from a color scheme
    def Color.set(scheme : Symbol, fg : Int8 = -1, bg : Int8 = -1)
      print Color.ansi_fg(SCHEMES[scheme][fg]) if fg >= 0
      print Color.ansi_bg(SCHEMES[scheme][bg]) if bg >= 0
    end

    # print ansi reset
    def Color.reset
      print ESC_RESET
    end

    # print text with colors from a color scheme
    def Color.print(text : String, scheme : Symbol, fg : Int8 = -1, bg : Int8 = -1)
      self.set(scheme, fg, bg)
      print text
      self.reset
    end
  end
end
