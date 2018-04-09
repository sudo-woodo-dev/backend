class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      user = User.new
  end
end
