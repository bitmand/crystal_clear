# TODO: Write documentation for `CrystalClear`
module CrystalClear
  class Spinner
    FRAMES = %w{⠋ ⠙ ⠸ ⠴ ⠦ ⠇}
    INTERVAL = 1.second / 10

    def Spinner.start(text = "", color_scheme = :bright)
      color_idx = 0
      text.size.zero? || print text
      spawn do
        while true
          FRAMES.each do |char|
            print ESC + "38;5;%sm%s " % [Color::SCHEMES[color_scheme][color_idx], char]
            sleep INTERVAL
            print ESC + "2D"
            color_idx += 1
            color_idx = 0 if color_idx >= Color::SCHEMES[color_scheme].size
          end
        end
      end
    end

    def Spinner.stop(text = "")
      # reset last spinner chars
      print ESC + "2D  "
      print ESC + "2D"
      # reset color
      print ESC + "0m"
      # print message
      text.size.zero? || print text
    end
  end
end
