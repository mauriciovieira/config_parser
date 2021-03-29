module ConfigParser
  class Manager
    def initialize
      @line_parser = LineParser.new
    end

    def parse(file_path)
      config = {}
      reader = FileReader.new
      reader.read(file_path) do |line|
        config.merge!(@line_parser.parse(line))
      end
      config
    end
  end
end
