class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.notice = 'Welcome back'
      redirect_to new_session_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end
end