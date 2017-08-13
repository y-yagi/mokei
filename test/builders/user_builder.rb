class UserBuilder < Mokei::Builder::Base
  def dummy
    target.email = "dummy@example.com"
    target.name = "dummy account"
  end

  def active
    target.active = true
  end
end
