class SessionsController < ApplicationController
  def signin
    @user = User.find_by(id: params[:id])

    if @user && @user.authenticate(password: params[:password])
      # redirect to members page
      "successful signin"
    else
      "something went wrong"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)

    if @user.save
      session[:user_id] = @user.id
      "successful user creation"
      # redirect to new member page
    else
      flash[:notice] = "Error Signing Up"
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(allowed_params)
      # redirect to user profile
      "user info updated successfully"
    else
      # display error and redirect to user profile
      "something went wrong"
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user.destroy
      redirect_to '/'
    else
      # display error
    end
  end

  def signout
    session.clear
    redirect_to '/'
  end

  private

    def allowed_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
