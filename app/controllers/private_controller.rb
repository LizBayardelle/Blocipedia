class PrivateController < ApplicationController

  def index
    @wikis = current_user.wikis
    @private_wikis = @wikis.where(private: true)
  end

end
