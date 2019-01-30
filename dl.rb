#!/usr/bin/env ruby
require 'fileutils'
require 'json'

arg = ARGV.last.dup
file = File.open 'seasons.json'
seasons = JSON.parse(file.read)

# regex match argument to a season
selection = seasons.find {|season, episodes| /#{arg}.*/.match season}

# if season not found
if not selection
	puts 'Season info not found, try one of the following:'
	puts seasons.keys
	exit
end

season = selection[0]
episodes = selection[1]

# make directory and change to it
FileUtils.mkdir_p season
Dir.chdir season

# download each episode
episodes.each do |episode|
	file_name = "#{episode[1]}.mp4"
	url = episode[0]
	cookies = (File.exist? '../cookies.txt') ? '--cookies ../cookies.txt' : ''

	if File.exist? file_name
		puts "#{file_name} already exists"
		next
	end

	puts "\n\n\nDownloading #{url} \r\n\n"
	system "youtube-dl #{cookies} -o #{file_name} #{url}"
end


