require 'simplecov'
require "minitest/autorun"
require 'minitest/spec'
SimpleCov.start do
  add_filter 'test'
end
require "blank_slate"
