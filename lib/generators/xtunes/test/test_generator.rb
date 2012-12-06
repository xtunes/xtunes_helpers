module Xtunes
  class TestGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_files
      template 'home_controller.rb', 'app/controllers/home_controller.rb'
      empty_directory 'app/views/home'
      template 'index.html.erb', 'app/views/home/index.html.erb'
      route 'match "/home" => "home#index"'
    end
  end
end