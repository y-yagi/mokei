$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "mokei"
require "active_record"

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Base.logger = Logger.new(File::NULL)

ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string :name
    t.string :email
    t.boolean :active, default: false
  end
end

require_relative "models/user"
require_relative "builders/user_builder"
require "minitest/autorun"
