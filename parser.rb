#!/usr/bin/env ruby
#
require_relative './lib/analizer'
require_relative './lib/log_parser'

parser   = LogParser.read_file(ARGV[0])
analizer = Analyzer.new(parser.entries)

analizer.aggregate(unique: false).each do |entry|
  puts "#{entry[0]} #{entry[1]} visits"
end

puts "\n"

analizer.aggregate(unique: true).each do |entry|
  puts "#{entry[0]} #{entry[1]} visits"
end
