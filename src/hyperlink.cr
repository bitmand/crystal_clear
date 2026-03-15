module CrystalClear
    # Some terminal emulators support hyperlinks:
    # https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda
    # https://github.com/Alhadis/OSC8-Adoption/
  class Hyperlink
    property url : String
    property text : String
    # TODO: add support for id:
    #       https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda#hover-underlining-and-the-id-parameter
    #property id : String = ""

    def initialize(@url, @text = "")
    end

    # return working hyperlink for supported terminals
    def print
      OSC_8 + ";;" + @url + ESC_ST + @text + OSC_8 + ";;" + ESC_ST
    end
  end
end
