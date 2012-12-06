class SessionsController < ApplicationController

  def new
    @resource = User.new
  end

  def create
    @resource = User.new
    @resource = User.authenticate params[:user][:login], params[:user][:password]
    if @resource
      session[:user] = @resource.id
      redirect_back_or_default params[:return_to] || root_url
    else
      redirect_to signin_url, :alert => 'invalid_name_or_password'
    end
  end

  def destroy
    session[:user] = nil if params[:user]
    redirect_to root_url, :notice => 'sign_out'
  end
end
