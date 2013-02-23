require "bundler/gem_tasks"
require "simplecov"

desc "Test and run coverage"
task :test do
  SimpleCov.start
  load 'test/lib/blank_slate_test.rb'
end

task :default => :test