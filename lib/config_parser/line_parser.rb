class ConfigParser::LineParser
  def parse(line)
    return if /^#/.match?(line)

    if /=/.match?(line)
      key, value = line.split(/=/, 2).map do |word|
        word.chomp.strip
      end

      {key => value}
    end
  end
end
