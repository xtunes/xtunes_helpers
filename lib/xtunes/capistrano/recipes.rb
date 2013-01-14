require 'capistrano'
require 'capistrano/cli'
require File.join(File.dirname(__FILE__),'helpers.rb')
#require 'xtunes/capistrano/helpers'

Dir.glob(File.join(File.dirname(__FILE__), '/recipes/*.rb')).sort.each { |f| load f }