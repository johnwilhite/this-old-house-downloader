#!/usr/bin/env ruby
require 'fileutils'

season = ARGV.last.dup

# match to season directory and cd if it exists
dir = Dir.glob("#{season}*").first.to_s
abort 'Season directory not found' unless !dir.empty? && Dir.chdir(dir)

File.open('list.txt', 'r') do |list|
  list.each_line do |line|
    puts line

    # create file name as S##E##-name
    # if line contains # use everything after that as ep name, else use last two chars
    line = line.gsub("\n", '')
    season.slice! 'toh-'
    season_padded = season.to_s.rjust(2, '0')
    episode_padded = line.include?('#') ? line.partition('#').last : line.chars.last(2).join
    name = line.split('/')[-1]
    name = name.split('#')[0]
    file_name = "S#{season_padded}E#{episode_padded}-#{name}.mp4"
    cookies = (File.exist? '../cookies.txt') ? '--cookies ../cookies.txt' : ''

    next if File.exist? file_name

    system "youtube-dl #{cookies} -o #{file_name} #{line}"
  end
end
