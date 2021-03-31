module ConfigParser
  class LineParser
    def parse(line)
      if /=/.match?(line)
        key, value = line.split(/=/, 2).map do |word|
          word.chomp.strip
        end

        new_value = parse_types(value)
        return {key => new_value}
      end
      {}
    end

    private

    def parse_types(value)
      if value.to_i.to_s == value
        value.to_i
      elsif value.to_f.to_s == value
        value.to_f
      elsif /^(true|yes|on)$/.match?(value)
        true
      elsif /^(false|no|off)$/.match?(value)
        false
      else
        value
      end
    end
  end
end
