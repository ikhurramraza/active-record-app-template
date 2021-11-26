# frozen_string_literal: true

ActiveRecord::Base.establish_connection(Application.database_config)

if !Application.running_rake_task? && ActiveRecord::Base.connection.migration_context.needs_migration?
  abort 'Database schema is not up to date. Please run `rake db:migrate`.'
end
