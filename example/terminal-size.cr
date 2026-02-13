require "../src/crystal_clear"

term = CrystalClear::Terminal.new

puts "Cols: %s" % term.size.cols
puts "Rows: %s" % term.size.rows

puts "Pixels: %s x %s" % [term.size.width, term.size.height]
