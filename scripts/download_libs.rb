require 'fileutils'
require 'open-uri'

FORCE_REPLACE = ENV['FORCE_REPLACE']

File.readlines("LIBRARIES").each do |lib|
  next if lib[0] == "#" || lib =~ /^\s*$/

  lib.chomp!

  uri = URI.parse lib

  local_path = "./public#{uri.path}"

  next if File.exists?(local_path) && !FORCE_REPLACE

  puts "Downloading #{lib}"

  local_dir  = File.dirname local_path
  FileUtils.mkdir_p local_dir

  File.open(local_path, 'w') do |f|
    f.puts uri.read
  end
end
