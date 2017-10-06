class ComicsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
  end

  def show
    @comic = Comic.find(params[:comicid])
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = current_user.comics.new(comic_params)
    if @comic.save
      redirect_to user_path(current_user)
    else
      redirect_to new_comic_path
    end
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  def update
    @comic = Comic.find(params[:id])
    if @comic.update_attributes(comic_params)
      redirect_to comic_path(params[:id])
    else
      flash[:danger] = 'Please double check all fields'
      redirect_to edit_comic_path
    end
  end

  def destroy
  end

  private
  def comic_params
    params.required(:comic).permit(:title, :issue_number, :price, :image_url, :purchsed)
  end
end
