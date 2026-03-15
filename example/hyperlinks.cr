require "../src/crystal_clear"

link = CrystalClear::Hyperlink.new("https://github.com/bitmand/crystal_clear", "CrystalClear Github page")
puts "Link to %s (hold Ctrl/Cmd and click the link)." % link.print

gist = CrystalClear::Hyperlink.new("https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda", "Egmont Koblingers gist")
adopt = CrystalClear::Hyperlink.new("https://github.com/Alhadis/OSC8-Adoption/", "Alhadis' page")
puts "See %s for more info and %s about terminal emulator adoption." % [gist.print, adopt.print]
