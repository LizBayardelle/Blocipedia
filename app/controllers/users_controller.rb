class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @wikis = current_user.wikis
  end

  def downgrade
    @user = User.find(params[:id])
    @user.update_attribute(:premium, false)
  end
end
