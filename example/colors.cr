require "../src/crystal_clear"

alias Color = CrystalClear::Color

puts "%-25s  %-25s  %-25s  %-25s  %-25s  %-25s" % Color::SCHEMES.to_a.map(&.first).map{|name| "Color::SCHEMES[:%s]" % name}
puts "%-25s  %-25s  %-25s  %-25s  %-25s  %-25s" % Color::SCHEMES.to_a.map{|_| "-" * 23}

(0..Color::SCHEMES.to_a.max_of(&.last.size)).map(&.to_i8).each do |idx|
  Color::SCHEMES.keys.each do |scheme|
    if idx < Color::SCHEMES[scheme].size
      print "%2s  " % idx
      Color.print("     ", scheme, bg: idx)
      Color.print(" ABCDE abcde      ", scheme, fg: idx)
    else idx < 20
      print " " * 27
    end
  end
  puts
end
