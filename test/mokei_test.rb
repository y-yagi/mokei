require 'test_helper'

class MokeiTest < Minitest::Test
  def test_build
    user = UserBuilder.new.dummy.active.build

    assert_instance_of User, user
    assert_equal "dummy account", user.name
    assert_equal "dummy@example.com", user.email
    assert user.active
    refute user.persisted?
  end

  def test_create
    user = UserBuilder.new.dummy.active.create!

    assert_instance_of User, user
    assert_equal "dummy account", user.name
    assert_equal "dummy@example.com", user.email
    assert user.active
    assert user.persisted?
  end

  def test_target_class_does_not_exist
    assert_raises(NameError) { NotExistBuilder.new.build }
  end
end
