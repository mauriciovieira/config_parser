class ConfigParser::LineParser
  def parse(line)
    return if /^#/.match?(line)

    if /=/.match?(line)
      key, value = line.split(/=/, 2).map do |word|
        word.chomp.strip
      end

      new_value = parse_types(value)
      {key => new_value}
    end
  end

  private

  def parse_types(value)
    if value.to_i.to_s == value
      value.to_i
    elsif value.to_f.to_s == value
      value.to_f
    else
      value
    end
  end
end
