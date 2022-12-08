require 'rake/testtask'
require './app'

namespace :solve do

  task :all do
    runner = Aoc::Runner.new
    (1..25).each { |i| runner.call(i) }
  end

  (1..25).each do |i|
    desc "Run day #{i}"
    task i.to_s.to_sym do
      Aoc::Runner.new.call(i)
    end
  end
end

Rake::TestTask.new do |t|
  t.pattern = 'test/*_test.rb'
end
