# frozen_string_literal: true

require 'active_record'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

Dir['tasks/**/*.rb'].each { |file| require_relative file }

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new

task default: %i[spec rubocop]

desc 'Load the application'
task :environment do
  require_relative 'config/boot'
end

namespace :db do
  desc 'Migrate the database'
  task migrate: [:environment] do
    ActiveRecord::Base.connection.migration_context.migrate
  end

  desc 'Rollback the database'
  task rollback: [:environment] do
    step = ENV.fetch('STEP', 1).to_i
    ActiveRecord::Base.connection.migration_context.rollback(step)
  end

  desc 'Load the seeds'
  task seed: [:environment] do
    load Application.root.join('db/seeds.rb').to_s
  end
end

namespace :generate do
  desc 'Generate a migration'
  task migration: [:environment] do
    Tasks::GenerateMigration.new(ARGV[1]).run! && exit
  end
end
