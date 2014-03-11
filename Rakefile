require 'rake'
require 'rspec/core/rake_task'

require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'

# desc "Run all RSpec code examples"
# RSpec::Core::RakeTask.new(:rspec) do |t|
#   # t.rspec_opts = File.read("spec/spec.opts").chomp rescue false || ""
# end

# SPEC_SUITES = (Dir.entries('spec') - ['.', '..','fixtures']).select {|e| File.directory? "spec/#{e}" }
# namespace :rspec do
#   SPEC_SUITES.each do |suite|
#     desc "Run #{suite} RSpec code examples"
#     RSpec::Core::RakeTask.new(suite) do |t|
#       t.pattern = "spec/#{suite}/**/*_spec.rb"
#       # t.rspec_opts = File.read("spec/spec.opts").chomp rescue false || ""
#     end
#   end
# end

PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "vendor/**/*.pp"]

desc "Run syntax, lint, and spec tests."
task :test => [
  :syntax,
  :lint,
  :spec
]

task :default => :test
