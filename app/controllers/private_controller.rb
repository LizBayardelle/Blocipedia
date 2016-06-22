class PrivateController < ApplicationController

  def index
    @wikis = Wiki.all
    @private_wikis = @wikis.where(private: true)
  end

end
