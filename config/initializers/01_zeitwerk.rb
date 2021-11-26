# frozen_string_literal: true

Zeitwerk::Loader.new.tap do |loader|
  loader.push_dir('app/models')
  loader.push_dir('lib')
  loader.setup
end
