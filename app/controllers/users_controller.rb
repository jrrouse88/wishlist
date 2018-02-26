class UsersController < ApplicationController
  before_action :authorize, only:[:edit, :update, :destroy]
  

  def index
  end

  def show
    # assign comics to all instances of a comic
    @comics = Comic.all
    # find a user by the parameter which should be an id
    @user = User.find(params[:id])
  end

  def new
    # create a new instance of a user
    @user = User.new
  end

  def create
    # create functionality to save the new user
    @user = User.new(user_params)
    if @user.save
      # start a new session with the successfully created user and redirect to their profile
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      # flash error message and send user back to the form
      flash[:danger] = "Please double check all fields"
      redirect_to new_user_path
    end
  end

  def edit
    
  end

  def update
    if current_user.update_attributes(user_params)
      # redirect user to profile page upon successful update
      redirect_to user_path
    else
      # flash error message and send user back to edit page upon unsuccessful update
      flash[:danger] = 'Please double check all fields'
      redirect_to edit_user_path
    end
  end

  def destroy
    # destroy the current user instance
    current_user.destroy
    # destroy the session
    session[:user_id] = nil
    # redirect to the home page
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
