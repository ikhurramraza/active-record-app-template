# frozen_string_literal: true

module Application
  extend self

  def run!
    run_initializers!
  end

  def root
    @root ||= Pathname.new(File.dirname(__dir__))
  end

  def env
    @env ||= ActiveSupport::StringInquirer.new(ENV.fetch('TEMPLATE_APP_ENV', 'development'))
  end

  def logger
    @logger ||= Logger.new("log/#{env}.log")
  end

  def running_rake_task?
    $PROGRAM_NAME.include?('rake')
  end

  def database_config
    @database_config ||= YAML.load_file(root.join('config', 'database.yml'), aliases: true).fetch(env.to_s)
  end

  private

  def run_initializers!
    Dir['config/initializers/*.rb'].each { |file| require_relative file.delete_prefix('config/') }
  end
end
