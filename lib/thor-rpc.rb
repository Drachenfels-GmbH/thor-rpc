require "thor-rpc/version"

require 'rack/rpc'
require 'thor'

class Thor
  module RPC
    SERVERS = {}

    class << self
      def simple_name(clazz)
        clazz.name.to_s.split("::").last
      end

      def add_server(name, server)
        puts "Adding Server: Servers::#{name}"
        SERVERS[name] = server
      end

      def get_server(name)
        SERVERS[name]
      end

      def register_server(task_clazz)
        server = Class.new(Rack::RPC::Server) do
          define_method :run_task do |task_name, args|
            task = task_clazz.tasks[task_name]
            task.run task_clazz.new, args
          end
        end
        add_server(simple_name(task_clazz), server)
      end

      def register_method(server_clazz, meth)
        puts "Adding method: #{meth.to_s}"
        server = get_server(simple_name(server_clazz))
        server.class_eval do
          define_method meth.to_s.to_sym do |*args|
            run_task(meth.to_s, args)
          end
          rpc meth.to_s => meth.to_s.to_sym
        end
      end
    end
  end

  def self.inherited(child_class)
    super
    Thor::RPC.register_server(child_class)
  end

  def self.method_added(meth)
    super
    Thor::RPC.register_method(self, meth)
  end
end