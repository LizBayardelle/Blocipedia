class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @wikis = current_user.wikis
    @private_wikis = @wikis.where(private: true)
    @public_wikis = @wikis.where(private: false)
  end

  def downgrade
    @wikis = current_user.wikis
    @user = User.find(params[:id])
    @user.update_attribute(:premium, false)
    @wikis.each do |wiki|
      wiki.update_attribute(:private, false)
    end
    redirect_to edit_user_registration_path
  end
end
