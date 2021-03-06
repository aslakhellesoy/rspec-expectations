require 'bundler'
Bundler.setup
Bundler::GemHelper.install_tasks

require 'rake'
require 'rake/rdoctask'
require 'rspec/core/rake_task'
require 'rspec/expectations/version'
require 'cucumber/rake/task'

RSpec::Core::RakeTask.new(:spec)

class Cucumber::Rake::Task::ForkedCucumberRunner
  # When cucumber shells out, we still need it to run in the context of our
  # bundle.
  def run
    sh "bundle exec #{RUBY} " + args.join(" ")
  end
end

desc "Run all examples using rcov"
RSpec::Core::RakeTask.new :rcov => :cleanup_rcov_files do |t|
  t.rcov = true
  t.rcov_opts =  %[-Ilib -Ispec --exclude "gems/*,features"]
  t.rcov_opts << %[--text-report --sort coverage --no-html --aggregate coverage.data]
end

task :cleanup_rcov_files do
  rm_rf 'coverage.data'
end

Cucumber::Rake::Task.new :cucumber => :cleanup_rcov_files do |t|
  t.cucumber_opts = %w{--format progress}
  t.rcov = true
  t.rcov_opts =  %[-Ilib -Ispec --exclude "gems/*,features"]
  t.rcov_opts << %[--text-report --sort coverage --aggregate coverage.data]
end

task :default => [:spec, :cucumber]

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rspec-expectations #{RSpec::Expectations::Version::STRING}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :clobber do
  rm_rf 'doc'
  rm_rf 'pkg'
  rm_rf 'tmp'
  rm_rf 'coverage'
end

