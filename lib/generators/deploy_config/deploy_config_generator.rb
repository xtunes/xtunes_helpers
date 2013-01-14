class DeployConfigGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  def copy_deploy_config_files
  	old_rubyopt,ENV['RUBYOPT'] = ENV['RUBYOPT'], ''
  	run 'capify .'
  	uncomment_lines 'Capfile', "load 'deploy/assets'"
  	remove_file 'config/deploy.rb'
  	template 'deploy.rb.erb', 'config/deploy.rb'
  	ENV['RUBYOPT'] = old_rubyopt
  end

  private

  def project_name
  	File.basename(Dir.getwd)
  end
end
