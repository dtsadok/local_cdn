require 'rack'
run Rack::File.new 'public'
