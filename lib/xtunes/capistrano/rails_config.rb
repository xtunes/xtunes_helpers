unless Capistrano::Configuration.respond_to?(:instance)
  abort "This extension requires Capistrano 2"
end

Capistrano::Configuration.instance.load do
  namespace :deploy do
    namespace :rails_config do
      task :symlink, :except => { :no_release => true } do
        run "ln -nfs #{shared_path}/config/settings.local.yml #{release_path}/config/settings.local.yml"
      end
    end
    after "deploy:finalize_update", "deploy:rails_config:symlink"
  end
end