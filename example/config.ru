require 'thor-rpc'
load 'simple.thor'

app = lambda do |env|
  [404, [], ["Not Found!"]]
end

Thor::RPC::SERVERS.each_pair do |key, server|
  puts "Register endpoint #{server}: /#{key.downcase}"
  use Rack::RPC::Endpoint, server.new, :path => "/#{key.downcase}"
end

run app
