class UsersController < ApplicationController
  before_action :authorize, only:[:edit, :update, :destroy]
  

  def index
  end

  def show
    @comics = Comic.all
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:danger] = "Please double check all fields"
      redirect_to new_user_path
    end
  end

  def edit
    
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to user_path
    else
      flash[:danger] = 'Please double check all fields'
      redirect_to edit_user_path
    end
  end

  def destroy
    current_user.destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
