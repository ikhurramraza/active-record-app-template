# frozen_string_literal: true

module Tasks
  class GenerateMigration
    def initialize(name)
      @name = name
      @timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    end

    def run!
      abort('Migration name is missing: `rake generate:migration YourMigration`') if name.blank?

      File.open(path, 'w') { |file| file.write(migration_content) }
    end

    private

    attr_reader :name, :timestamp

    def path
      Application.root.join("db/migrate/#{timestamp}_#{name.underscore}.rb").to_s
    end

    def migration_version
      ActiveRecord.version.segments.first(2).join('.')
    end

    def migration_content
      <<~MIGRATION
        class #{name} < ActiveRecord::Migration[#{migration_version}]
          def change
          end
        end
      MIGRATION
    end
  end
end
