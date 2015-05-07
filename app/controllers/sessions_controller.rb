class SessionsController < ApplicationController
  def login
    # render 'login'
  end

  def signin
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      # redirect to members page
      session[:user_id] = @user.id
      redirect_to members_show_path
    else
      flash[:error] = "Login error"
      p "something went wrong"
      render 'login'
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
      redirect_to new_profile_path
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
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_type, :phone, :gender, :birth_date)
    end
end
