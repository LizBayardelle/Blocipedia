class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @wikis = Wiki.where(owner: current_user)
    @private_wikis = Wiki.where(private: true)
    @public_wikis = Wiki.where(private: false)
  end

  def downgrade
    @wikis = current_user.wikis
    @user = User.find(params[:id])
    @user.update_attribute(:premium, false)
    @wikis.update_all(private: false)
    redirect_to edit_user_registration_path
  end
end
