require "../src/crystal_clear"

color = CrystalClear::Color.new(:pastel)
"This text is pastel rainbow colored".each_char{ |char| print color.next_fg + char }
puts color.reset
