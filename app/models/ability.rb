class Ability
  include CanCan::Ability

  def initialize(user)
    can :perform, :guest_actions if user.nil?
    can :perform, :non_guest_actions if user.present?
  end
end
