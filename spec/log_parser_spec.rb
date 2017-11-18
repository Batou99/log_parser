require 'log_parser'
require 'log_entry'

describe LogParser do
  describe "#initialize" do
    it "should have [] entries" do
      expect(LogParser.new.entries).to eq([])
    end
  end

  describe ".parse_entry" do
    it "should split path and ip" do
      log_entry = LogParser.parse_entry("/foo 192.168.1.1")
      expect(log_entry.path).to eq("/foo")
      expect(log_entry.ip).to eq("192.168.1.1")
    end
  end

  describe ".read_file" do
    it "should process every entry" do
      lines = [
        "/help_page/1 126.318.035.038",
        "/contact 184.123.665.067"
      ]
      filename = "foo.log"
      allow(File).to receive(:readlines).with(filename).and_return lines

      entries = LogParser.read_file(filename).entries

      expect(entries.size).to eq(2)
      expect(entries[0].path).to eq("/help_page/1")
      expect(entries[0].ip).to eq("126.318.035.038")
      expect(entries[1].path).to eq("/contact")
      expect(entries[1].ip).to eq("184.123.665.067")
    end

  end
end


  
