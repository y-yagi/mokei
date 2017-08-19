# Mokei

[![Build Status](https://travis-ci.org/y-yagi/mokei.svg?branch=master)](https://travis-ci.org/y-yagi/mokei) [![Code Climate](https://codeclimate.com/github/y-yagi/mokei/badges/gpa.svg)](https://codeclimate.com/github/y-yagi/mokei)

`Mokei` is a builder for Rails applications. It is mainly intended for use in test.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mokei'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mokei

## Usage

```ruby
# migration file
ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string :name
    t.string :email
    t.boolean :active, default: false
  end
end

# model
class User < ActiveRecord::Base
end
```

```ruby
# builder
# test/builders/user_builder.rb
class UserBuilder < Mokei::Builder::Base
  def dummy
    target.email = "dummy@example.com"
    target.name = "dummy account"
  end
end
```

```
user = UserBuilder.new.dummy.build
=> #<User id: nil, name: "dummy account", email: "dummy@example.com", active: false, created_at: nil, updated_at: nil>
```

By calling the `build` method you can get the object to build. Within the builder class, you can use the object to be built with `target`.

Also, the method defined for the builder is chainable.

```ruby
# builder
# test/builders/user_builder.rb
class UserBuilder < Mokei::Builder::Base
  def dummy
    target.email = "dummy@example.com"
    target.name = "dummy account"
  end

  def registered
    target.active = true
  end
end
```

```
user = UserBuilder.new.dummy.registered.build
=> #<User id: nil, name: "dummy account", email: "dummy@example.com", active: true, created_at: nil, updated_at: nil>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yuuji.yaginuma/mokei. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

