lib LibC
  {% if flag?(:linux) %}
    TIOCGWINSZ = 0x5413u32 # Linux
  {% elsif flag?(:darwin) || flag?(:bsd) %}
    TIOCGWINSZ = 0x40087468u32 # BSDs and MacOS
  {% else %}
    TIOCGWINSZ = 0x5468 # Solaris
  {% end %}

  fun ioctl(fd : LibC::Int, request : LibC::ULong, ...) : LibC::Int

  struct TTYSize
    cols : UInt16
    rows : UInt16
    width : UInt16
    height : UInt16
  end
end
