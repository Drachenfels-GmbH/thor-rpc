# Thor::Rpc

Thor::RPC generates RPC endpoints for executing [thor](https://github.com/wycats/thor) tasks.
It uses [rack-rpc](https://github.com/datagraph/rack-rpc) to generate the RPC endpoints.

## Installation

Add this line to your application's Gemfile:

    gem "thor-rpc", :git => "git://github.com/drachenfels-gmbh/thor-rpc.git"

And then execute:

    $ bundle

## Usage

Please have a look at the [config.ru](example/config.ru) in the example folder.

Thor::RPC and the thor files have to be loaded in the *config.ru*:
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

Currently there are no specs and unit tests, because it was just a simple prove of concept.
But you can test the code by running *rackup* in the example directory
and execute the [curl test script](example/test.sh) afterwards.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO

* tests, tests, tests
* concept for providing thor method options
* better logging
* warn when a method is registered more than once
* API browsing page similar to thor commandline help
* client stubs

