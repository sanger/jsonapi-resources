#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'fileutils'
require 'rake/testtask'

task :remove_test_db do
  FileUtils.rm_f(File.expand_path('test/test_db', __dir__))
end

Rake::TestTask.new do |t|
  t.verbose = false
  t.warning = false
  t.test_files = FileList['test/**/*_test.rb']
end

Rake::Task[:test].enhance([:remove_test_db])

task default: [:test]

desc 'Run benchmarks'
namespace :test do
  Rake::TestTask.new(:benchmark) do |t|
    t.pattern = 'test/benchmark/*_benchmark.rb'
  end
end
