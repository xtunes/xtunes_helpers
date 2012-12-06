class ApplicationController < ActionController::Base
  protect_from_forgery
  include Authentication::Controllers::Helpers

  protected

  def redirect_back_or_default(default)
    if default || session[:return_to]
      redirect_to( session[:return_to] || default )
    else
      redirect_to root_url
      include Xtunes::Authentication::Controllers::Helpers

  protected

  def redirect_back_or_default(default)
    if default || session[:return_to]
      redirect_to( session[:return_to] || default )
    else
      redirect_to root_url
    end
    session[:return_to] = nil
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def after_sign_in_path_for(resource)

  end

  def after_sign_out_path_for(resource)
  end

  def sign_out_and_redirect_to(resource)
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    root_path
  end
end
    session[:return_to] = nil
    include Xtunes::Authentication::Controllers::Helpers

  protected

  def redirect_back_or_default(default)
    if default || session[:return_to]
      redirect_to( session[:return_to] || default )
    else
      redirect_to root_url
    end
    session[:return_to] = nil
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def after_sign_in_path_for(resource)

  end

  def after_sign_out_path_for(resource)
  end

  def sign_out_and_redirect_to(resource)
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    root_path
  end
end

  def store_location
    session[:return_to] = request.fullpath
    include Xtunes::Authentication::Controllers::Helpers

  protected

  def redirect_back_or_default(default)
    if default || session[:return_to]
      redirect_to( session[:return_to] || default )
    else
      redirect_to root_url
    end
    session[:return_to] = nil
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def after_sign_in_path_for(resource)

  end

  def after_sign_out_path_for(resource)
  end

  def sign_out_and_redirect_to(resource)
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    root_path
  end
end

  def after_sign_in_path_for(resource)

    include Xtunes::Authentication::Controllers::Helpers

  protected

  def redirect_back_or_default(default)
    if default || session[:return_to]
      redirect_to( session[:return_to] || default )
    else
      redirect_to root_url
    end
    session[:return_to] = nil
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def after_sign_in_path_for(resource)

  end

  def after_sign_out_path_for(resource)
  end

  def sign_out_and_redirect_to(resource)
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    root_path
  end
end

  def after_sign_out_path_for(resource)
    include Xtunes::Authentication::Controllers::Helpers

  protected

  def redirect_back_or_default(default)
    if default || session[:return_to]
      redirect_to( session[:return_to] || default )
    else
      redirect_to root_url
    end
    session[:return_to] = nil
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def after_sign_in_path_for(resource)

  end

  def after_sign_out_path_for(resource)
  end

  def sign_out_and_redirect_to(resource)
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    root_path
  end
end

  def sign_out_and_redirect_to(resource)
    include Xtunes::Authentication::Controllers::Helpers

  protected

  def redirect_back_or_default(default)
    if default || session[:return_to]
      redirect_to( session[:return_to] || default )
    else
      redirect_to root_url
    end
    session[:return_to] = nil
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def after_sign_in_path_for(resource)

  end

  def after_sign_out_path_for(resource)
  end

  def sign_out_and_redirect_to(resource)
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    root_path
  end
end

  def after_sign_up_path_for(resource)
    root_path
    include Xtunes::Authentication::Controllers::Helpers

  protected

  def redirect_back_or_default(default)
    if default || session[:return_to]
      redirect_to( session[:return_to] || default )
    else
      redirect_to root_url
    end
    session[:return_to] = nil
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def after_sign_in_path_for(resource)

  end

  def after_sign_out_path_for(resource)
  end

  def sign_out_and_redirect_to(resource)
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    root_path
  end
end

  def after_update_path_for(resource)
    root_path
    include Xtunes::Authentication::Controllers::Helpers

  protected

  def redirect_back_or_default(default)
    if default || session[:return_to]
      redirect_to( session[:return_to] || default )
    else
      redirect_to root_url
    end
    session[:return_to] = nil
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def after_sign_in_path_for(resource)

  end

  def after_sign_out_path_for(resource)
  end

  def sign_out_and_redirect_to(resource)
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    root_path
  end
end
  include Xtunes::Authentication::Controllers::Helpers

  protected

  def redirect_back_or_default(default)
    if default || session[:return_to]
      redirect_to( session[:return_to] || default )
    else
      redirect_to root_url
    end
    session[:return_to] = nil
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def after_sign_in_path_for(resource)

  end

  def after_sign_out_path_for(resource)
  end

  def sign_out_and_redirect_to(resource)
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    root_path
  end
end
