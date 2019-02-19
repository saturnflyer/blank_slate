require 'simplecov'
SimpleCov.start do
  add_filter 'test'
end
require "minitest/autorun"
require 'minitest/spec'
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "blank_slate"
