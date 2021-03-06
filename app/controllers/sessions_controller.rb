class SessionsController < ApplicationController
  def create
    session[:user] = User.from_omniauth(env['omniauth.auth'])
    redirect_to cookies[:referer]
  end

  def destroy
    session[:user] = nil
    redirect_to root_url
  end

  def after_sign_in_path_for(resource)
  end
end
