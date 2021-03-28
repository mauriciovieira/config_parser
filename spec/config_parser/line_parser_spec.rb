RSpec.describe ConfigParser::LineParser do
  subject(:line_parser) { described_class.new }

  context "when begins with number sign" do
    let(:line) { "# This is a comment, ignore it" }

    it "is ignored" do
      expect(subject.parse(line)).to be_nil
    end
  end

  context "does not begin with number sign" do
    context "value is a normal string" do
      let(:line) { "host = test.com" }

      it "returns key: value" do
        expect(subject.parse(line)).to eq({"host" => "test.com"})
      end
    end

    context "value is a number" do
      let(:float_line) { "cost =12.56" }
      let(:integer_line) { "server_id = 32432" }

      it "returns a parsed float" do
        expect(subject.parse(float_line)).to eq({"cost" => 12.56})
      end

      it "returns a parsed integer" do
        expect(subject.parse(integer_line)).to eq({"server_id" => 32432})
      end
    end
  end
end
