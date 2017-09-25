class SessionsController < ApplicationController
  def new
  end

  def create
    #find a user by their email
    @user = User.find_by_email(params[:email])
    #if a user exists AND they're authenticated
    if @user and @user.authenticate(params[:password])
      #embed their id in the cookie
      session[:user_id] = @user.id
      #send them to their profile page
      redirect_to user_path(@user)
    else
      redirect_to new_session_path
    end
  end

  def destroy
  end
end
