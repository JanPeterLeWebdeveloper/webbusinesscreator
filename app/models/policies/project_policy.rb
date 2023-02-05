class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def user_index?
    true
  end

  def my_projects?
    true
  end

  def set_user
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
