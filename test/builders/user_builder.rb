class UserBuilder < Mokei::Builder::Base
  def dummy
    target.email = "dummy@example.com"
    target.name = "dummy account"
  end

  def active
    target.active = true
  end

  def with_todos
    todos.build(title: "support association")
    todos << TodoBuilder.new.expired.build
  end
end
