class ComicsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
  end

  def show
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = current_user.comics.new(comic_params)
    if @comic.save
      redirect_to user_path
    else
      redirect_to new_comic_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comic_params
    params.required(:comic).permit(:title, :issue_number, :price)
  end
end
