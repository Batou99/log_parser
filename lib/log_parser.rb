require_relative 'log_entry'

class LogParser

  attr_accessor :filename
  attr_reader   :entries
  
  def initialize
    @entries = []
  end

  def self.read_file(filename)
    parser = LogParser.new
    File.readlines(filename).each do |line|
      parser.entries << parse_entry(line)
    end
    parser
  end

  def self.parse_entry(string)
    path, ip = string.split(" ")
    LogEntry.new(path: path, ip: ip)
  end
end
