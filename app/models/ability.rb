# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    #can :manage # can access to all data
    can :manage, Task, owner_id: user.id # can access only by owner tasks
    can :read, Task, participating_users: { user_id: user.id }
    can :create, Note do |n|
      owner_id = Task.find(n.task_id).owner_id
      user_id = user.id 
      owner_id == user_id
    end
  end
end
