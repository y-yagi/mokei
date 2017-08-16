require 'test_helper'

class MokeiTest < Minitest::Test
  def test_build
    user = UserBuilder.new.dummy.active.with_todos.build

    assert_instance_of User, user
    assert_instance_of Todo, user.todos.first
    assert_equal "dummy account", user.name
    assert_equal "dummy@example.com", user.email
    assert_equal "support association", user.todos.first.title
    assert user.active
    refute user.persisted?
  end

  def test_create
    user = UserBuilder.new.dummy.active.with_todos.create!

    assert_instance_of User, user
    assert_equal "dummy account", user.name
    assert_equal "dummy@example.com", user.email
    assert user.active
    assert user.persisted?
    assert user.todos.first.persisted?
    assert user.todos.second.persisted?
    assert_equal 2, user.todos.count
  end

  def test_target_class_does_not_exist
    assert_raises(NameError) { NotExistBuilder.new.build }
  end
end
