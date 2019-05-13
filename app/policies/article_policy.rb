class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :record

  def index?
    return true if user.present?
  end

  def show?
    return true if user.present? && user.role['user']
  end

  def new?
    create?
  end

  def create?
    user.present?
  end

  def destroy?
    return true if user.present? && user.role['admin'] ||user.present? && user.id == record.user_id
  end

end
