class ConfigParser::LineParser
  def parse(line)
    return if /^#/.match(line)
  end
end