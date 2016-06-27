class PrivateController < ApplicationController
  before_action :require_premium

  def index
    @wikis = policy_scope(Wiki)
    @private_wikis = Wiki.where(private: true)
  end

  private

  def require_premium
    unless current_user.premium == true
      redirect_to new_charge_path
    end
  end

end
