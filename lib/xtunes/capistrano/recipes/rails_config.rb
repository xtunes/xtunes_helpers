unless Capistrano::Configuration.respond_to?(:instance)
  abort "This extension requires Capistrano 2"
end

Capistrano::Configuration.instance.load do
  unless exists?(:stage)
    set :stage, environment
  end
  namespace :deploy do
    namespace :rails_config do
      task :symlink, :except => { :no_release => true } do
        run "ln -nfs #{shared_path}/config/settings.local.yml #{release_path}/config/settings.local.yml"
      end
      task :up, :except => { :no_release => true } do
        template = File.read("config/settings.#{stage}.local.yml")

        run "mkdir -p #{shared_path}/config"
        put template, "#{shared_path}/config/settings.local.yml"
      end

      task :down, :except => {:no_release => true} do
        filename = "config/settings.#{stage}.local.yml"
        download "#{shared_path}/config/settings.local.yml", filename
      end
    end
    after "deploy:finalize_update", "deploy:rails_config:symlink"
  end
end