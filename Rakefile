require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "standard/rake"

path = File.expand_path(__dir__)
Dir.glob("#{path}/lib/tasks/*.rake").each { |f| import f }

RSpec::Core::RakeTask.new(:spec)

task default: "config_parser:ci"
