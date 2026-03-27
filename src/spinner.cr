# TODO: Write documentation for `CrystalClear`
module CrystalClear
  class Spinner
    FRAMES = {
      # https://en.wikipedia.org/wiki/Braille_ASCII#Braille_ASCII_values
      braille: %w{⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏},
      braille_short: %w{⠋ ⠙ ⠸ ⠴ ⠦ ⠇},
      braille_dot: %w{⠷ ⠯ ⠟ ⠻ ⠽ ⠾},
      bar_up_down: %w{▁ ▃ ▅ ▆ ▇ █ ▇ ▆ ▅ ▃},
    }
    INTERVAL = 1.second / 10

    getter type : Symbol
    getter color : Color
    getter color_scheme : Symbol
    property text : String
    getter? running : Bool = false

    def initialize(@type = :braille, @color_scheme = :light, @text = "", auto_start : Bool = true)
      @color = Color.new(@color_scheme)
      start if auto_start
    end

    def start
      return if running? # don't start if already running
      @running = true
      @text.empty? || print @text
      spawn do
        while running?
          FRAMES[@type].each do |char|
            # print colored frame + whitespace
            print @color.next_fg + char + " "
            sleep INTERVAL
            break unless running?
            # go back 2 chars in terminal
            print ESC_CSI + "2D"
          end
        end
      end
      self
    end

    def stop(text : String = "")
      @running = false
      Color.reset
      # delete spinner chars + whitespace and reset color
      print ESC_CSI + "2D  " + ESC_CSI + "2D"
      text.empty? || print "%s\n" % text
    end
  end
end
