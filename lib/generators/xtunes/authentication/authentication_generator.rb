module Xtunes
  module Generators
    class AuthenticationGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      class_option :model_name, :default => "user", :type => :string, :aliases => '-m', :desc => 'Model name for auth. Default is "user"'
      class_option :template_engine, :default => "haml", :type => :string, :aliases => '-e', :desc => 'Template engine for the views. Available options are "erb", "haml"'
      class_option :orm, :default => "active_record", :type => :string, :aliases => '-o', :desc => 'Orm name for auth. Available options are "active_record", "mongoid"'

      def init_initializer
        inject_into_file 'config/initializers/xtunes.rb', :before => 'end' do
          <<-RUBY
    config.orm = :#{options[:orm].to_s}
          RUBY
        end
      end

      def init_model
        create_file "app/models/#{options[:model_name]}.rb" do
          <<-RUBY
class #{options[:model_name].classify} < Authentication::Models::#{options[:orm].to_s.classify}
  attr_accessible :email, :username
end
          RUBY
        end
        if options[:orm].to_s == 'active_record'
          generate(:migration, "create_#{options[:model_name].pluralize}")
          Dir.foreach('db/migrate') do |file|
            path = File.join('db/migrate', file)
            if file.to_s.match(/create_#{options[:model_name].pluralize}/)
              remove_file path
              create_file path do
                <<-RUBY
class Create#{options[:model_name].classify.pluralize} < ActiveRecord::Migration
  def change
    create_table :#{options[:model_name].pluralize} do |t|

      t.string :username
      t.string :email
      t.string :role
      t.string :password_digest

      t.timestamps
    end
  end
end
                RUBY
              end
            end
          end
        end
      end

      def init_controller
        create_file "app/controllers/sessions_controller.rb" do
          <<-RUBY
class SessionsController < ApplicationController

  def new
    @resource = #{options[:model_name].camelize}.new
  end

  def create
    @resource = #{options[:model_name].camelize}.new
    @resource = #{options[:model_name].camelize}.authenticate params[:#{options[:model_name]}][:login], params[:#{options[:model_name]}][:password]
    if @resource
      session[:#{options[:model_name]}] = @resource.id
      redirect_back_or_default params[:return_to] || root_url
    else
      redirect_to signin_url, :alert => 'invalid_name_or_password'
    end
  end

  def destroy
    session[:#{options[:model_name]}] = nil if params[:#{options[:model_name]}]
    redirect_to root_url, :notice => 'sign_out'
  end
end
          RUBY
        end
        route "match '/#{options[:model_name].pluralize}/signin' => 'sessions#new', :via => :get, :as => 'signin'"
        route "delete '/#{options[:model_name].pluralize}/signout' => 'sessions#destroy', :as => 'signout'"
        route "match '/#{options[:model_name].pluralize}/signup' => 'registrations#new', :via => :get, :as => 'signup'"
        route "match '/#{options[:model_name].pluralize}/signup' => 'registrations#create', :via => :post, :as => 'signin'"
      end

      def init_helper
        inject_into_file 'app/controllers/application_controller.rb', :before => "end" do
          <<-RUBY
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
          RUBY
        end
      end

      def init_views
        copy_file "views/new.html.#{options[:template_engine]}", "app/views/sessions/new.html.#{options[:template_engine]}"
      end
    end
  end
end