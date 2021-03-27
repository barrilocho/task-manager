# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    #can :manage # can access to all data
    can :manage, Task, owner_id: user.id # can access only by owner tasks
    can :read, Task, participating_users: { user_id: user.id }
  end
end
