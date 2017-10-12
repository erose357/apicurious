class SessionsController < ApplicationController
  def create
    @user = User.update_or_create(request.env['omniauth.auth'])
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_index_path 
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
