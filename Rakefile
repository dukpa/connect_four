gem 'rspec'
require 'rspec/core/rake_task'

task :default => :spec

desc "run tests"
RSpec::Core::RakeTask.new do |task|
  task.pattern = Dir.glob("spec/*_spec.rb")
  task.rspec_opts = ['-f documentation', '-r ./rspec_config']
  task.verbose = false
end
