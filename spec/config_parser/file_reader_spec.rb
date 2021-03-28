RSpec.describe ConfigParser::FileReader do
  subject(:file_reader) { described_class.new }

  describe "When file exists" do
    it "opens the file" do
      file = path("spec/fixtures/config_data.txt")

      expect(subject.read(file)).not_to be nil
    end
  end

  describe "When file does not exist" do
    it "raises an IOError" do
      file = path("spec/fixtures/does_not_exist.txt")

      expect { subject.read(file) }.to raise_error(ConfigParser::IOError)
    end
  end
end
