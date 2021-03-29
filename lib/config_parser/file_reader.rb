module ConfigParser
  class FileReader
    def read(filename, mode = "r", &block)
      file = File.new(filename, mode)
      return file unless block
      file.each { |line| yield line }
    rescue => error
      raise ConfigParser::IOError.new error
    ensure
      file&.close
    end
  end
end
