class TodoBuilder < Mokei::Builder::Base
  def expired
    target.expiration_at = 1.day.before
    target.title = 'expired'
  end
end
