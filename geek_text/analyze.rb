#!/usr/bin/env ruby -Ku

# `find ~/gtd/projects/autocolors/autocolors/.samples -type f -exec file -F'|' '{}' \;`

# text
# program
# MED_Song (-> asn)
# very short file
#
# empty (d)
# data (d)
# executable (d)
# image (d)
# bitmap (d)
# catalog (d)
# BEAM (d)
# bitmap
# icon
# dylib
# Quake stuff
# ELF


require 'pp'

tallies = {}
master  = {}

processed = 0
File.open('/Users/jwecker/gtd/projects/autocolors/autocolors/.samples/all_types', 'r') do |all_files|
  all_files.each do |entry|
    entry = entry.split('|').map{|e| e.strip}
    #pp entry if entry[1].nil?
    next if entry[1].nil?
    cont = entry[1].include?('text') || entry[1].include?('program') || entry[1].include?('very short file') || entry[1].include?('MED_Song')
    next unless cont
    next if entry[0].include? 'all_types'
    next if entry[0].start_with? './html/'
    #puts entry[1]

    type = entry[1]
    name = "/Users/jwecker/gtd/projects/autocolors/autocolors/.samples/#{entry[0]}"
    tallies[type] ||= {}
    last_ch = nil
    print '.'
    #puts name
    $stdout.flush
    File.open(name, 'r') do |f|
      begin
        f.each_codepoint do |cp|
          ch = cp.chr(Encoding::UTF_8)
          tallies[type][ch] ||= 0
          tallies[type][ch] += 1
          master[ch] ||= 0
          master[ch] += 1
          unless last_ch.nil?
            digram = "#{last_ch}-#{ch}"
            tallies[type][digram] ||= 0
            tallies[type][digram] += 1
            master[digram] ||= 0
            master[digram] += 1
          end
          last_ch = ch
        end
      rescue
        $stderr.puts "Skipping #{name}"
      end
    end
    processed += 1
    break if processed > 2300
  end
end

tallies.each do |type, values|
  puts "\n---------------\n#{type}\n------------------"
  vals = values.sort_by{|k,n| -n}
  pp vals
end

puts "\n---------------\nEVERYTHING\n------------------"
vals = master.sort_by{|k,n| -n}
pp vals
#pp tallies.keys
