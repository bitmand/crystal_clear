require "./libc"

module CrystalClear
  class Terminal
    getter size = LibC::TTYSize.new

    def initialize
      # set terminal size
      self.refresh_size
      # update size if terminal is resized
      Signal::WINCH.trap do
        self.refresh_size
      end
    end

    def refresh_size : Nil
      LibC.ioctl(STDERR.fd, LibC::TIOCGWINSZ, pointerof(@size)).zero? || raise "ioctl failed"
    end
  end
end
