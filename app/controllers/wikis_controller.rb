class WikisController < ApplicationController
  def index
    @wikis = Wiki.order('created_at DESC')
    @public_wikis = @wikis.where(private: false)
  end

  def show
    @wiki = Wiki.find(params[:id])
    @users = @wiki.users.order(name: :asc)
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    if @wiki.save
      redirect_to @wiki
    else
      render :action => "new"
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all.order(name: :asc)
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(wiki_params)
      redirect_to @wiki
    else
      render action: :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy
    redirect_to wikis_path
  end

  private
  def wiki_params
    params.require(:wiki).permit(:user, :title, :body, :private, :user_ids => [])
  end
end
