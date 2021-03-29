RSpec.describe ConfigParser::Manager do
  subject(:manager) { described_class.new }

  context "when file is passed" do
    let(:result) {
      {
        "host" => "test.com",
        "server_id" => 55331,
        "cost" => 2.56,
        "user" => "user",
        "verbose" => true,
        "test_mode" => true,
        "debug_mode" => false,
        "log_file_path" => "/tmp/logfile.log",
        "send_notifications" => true
      }
    }
    let(:file_path) { path("spec/fixtures/original_data.txt") }

    it "parses correctly" do
      expect(subject.parse(file_path)).to eq(result)
    end
  end
end
