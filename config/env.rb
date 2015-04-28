require 'bundler/setup'
Bundler.require :default, ENV["RACK_ENV"]

R = Redis.new(:host => 'localhost', :port => 6379, :password => nil)


HOST = "http://localhost:3001"
