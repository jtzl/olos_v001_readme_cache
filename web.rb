#!/usr/bin/env ruby
require 'rubygems'
require 'rack'
require 'timeout'

class App
  def call(env)
    return [200, {"Content-Type" => "text/html"}, [File.read("index.html")]]
  end
end

### i reject and denounce what's about to happen

rackit = fork do
  Rack::Handler::WEBrick.run(App.new, :Port => 80)
end

Process.detach(rackit)
sleep(15)
system("sudo pkill -9 -f web\.rb")
