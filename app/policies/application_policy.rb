class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show
    @wikis = current_user.wikis
    @private_wikis = @wikis.where(private: true)
    @public_wikis = Wiki.where(private: false)
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
