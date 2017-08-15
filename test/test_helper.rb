$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "mokei"
require "active_record"
require "byebug"

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Base.logger = Logger.new(File::NULL)

ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string :name
    t.string :email
    t.boolean :active, default: false
  end
end

Dir["test/models/**/*.rb"].each { |f| require File.expand_path(f) }
Dir["test/builders/**/*.rb"].each { |f| require File.expand_path(f) }
require "minitest/autorun"
