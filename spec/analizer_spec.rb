require 'analizer'
require 'log_entry'

describe Analyzer do
  before :each do
    log_entries = [
      LogEntry.new(path: "/help_page/1", ip: "126.318.035.038"),
      LogEntry.new(path: "/help_page/1", ip: "126.318.035.038"),
      LogEntry.new(path: "/help_page/1", ip: "126.318.035.038"),
      LogEntry.new(path: "/contact",     ip: "126.318.035.038"),
      LogEntry.new(path: "/contact",     ip: "10.10.10.1")
    ]

    @analizer = Analyzer.new(log_entries)
  end

  describe ".aggregate" do
    it "it should do unique aggregation desc" do
      values = @analizer.aggregate(unique: true, order: :desc)
      expect(values[0]).to eq ["/contact", 2]
      expect(values[1]).to eq ["/help_page/1", 1]
    end

    it "it should do unique aggregation asc" do
      values = @analizer.aggregate(unique: true, order: :asc)
      expect(values[0]).to eq ["/help_page/1", 1]
      expect(values[1]).to eq ["/contact", 2]
    end

    it "it should do non unique aggregation desc" do
      values = @analizer.aggregate(unique: false, order: :desc)
      expect(values[0]).to eq ["/help_page/1", 3]
      expect(values[1]).to eq ["/contact", 2]
    end

    it "it should do non unique aggregation asc" do
      values = @analizer.aggregate(unique: false, order: :asc)
      expect(values[0]).to eq ["/contact", 2]
      expect(values[1]).to eq ["/help_page/1", 3]
    end
  end

end


  
