# Thor::Rpc

Thor::RPC generates RPC endpoints using [rack-rpc](https://github.com/datagraph/rack-rpc) for
[thor](https://github.com/wycats/thor) files.

## Installation

Add this line to your application's Gemfile:

    gem 'thor-rpc'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install thor-rpc

## Usage

Please have a look at the [config.ru](example/config.ru) the example folder.

Thor::RPC and the thor files to use have to be loaded in the *config.ru*:
<pre>
require 'thor-rpc'
load 'simple.thor'
</pre>

The RPC server classes are dynamically generated but must be manually registered:
<pre>
# register servers created from thor classes
Thor::RPC::SERVERS.each_pair do |key, server|
  puts "Register endpoint #{server}: /#{key.downcase}"
  use Rack::RPC::Endpoint, server.new, :path => "/#{key.downcase}"
end
</pre>

The endpoint can easily be tested with *curl* see [test.sh](example/test.sh).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO

* support method parameters
* add warning when defining method more than once
* add API browsing page
* generate client stubs

