class WikisController < ApplicationController
  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.friendly.find(params[:id])
    @users = @wiki.users.order(name: :asc)
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.owner = current_user
    if @wiki.save
      redirect_to @wiki
    else
      render :action => "new"
    end
  end

  def edit
    @wiki = Wiki.friendly.find(params[:id])
    @users = User.all.order(name: :asc)
  end

  def update
    @wiki = Wiki.friendly.find(params[:id])
    if @wiki.update_attributes(wiki_params)
      redirect_to @wiki
    else
      render action: :edit
    end
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:id])
    @wiki.destroy
    redirect_to wikis_path
  end

  private
  def wiki_params
    params.require(:wiki).permit(:user, :title, :body, :private, :owner, :user_ids => [])
  end
end
