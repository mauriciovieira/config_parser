RSpec.describe ConfigParser::LineParser do
  subject(:line_parser) { described_class.new }

  context "when begins with number sign" do
    let(:line) { "# This is a comment, ignore it" }

    it "is ignored" do
      expect(subject.parse(line)).to eq({})
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

    context "value is a boolean" do
      let(:yes_line) { "send_notifications=   yes" }
      let(:on_line) { "debug_mode = on " }
      let(:true_line) { "ruby_is_nice   = true" }
      let(:no_line) { "warn_shareholders= no" }
      let(:off_line) { "test_mode =off" }
      let(:false_line) { "verbose  =false" }

      it "returns true if value is yes" do
        expect(subject.parse(yes_line)).to eq({"send_notifications" => true})
      end

      it "returns true if value is on" do
        expect(subject.parse(on_line)).to eq({"debug_mode" => true})
      end

      it "returns true if value is true" do
        expect(subject.parse(true_line)).to eq({"ruby_is_nice" => true})
      end

      it "returns false if value is no" do
        expect(subject.parse(no_line)).to eq({"warn_shareholders" => false})
      end

      it "returns false if value is off" do
        expect(subject.parse(off_line)).to eq({"test_mode" => false})
      end

      it "returns false if value is false" do
        expect(subject.parse(false_line)).to eq({"verbose" => false})
      end
    end
  end
end
