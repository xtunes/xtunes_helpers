Capistrano::Configuration.instance.load do
  namespace :passenger do
    desc "|DarkRecipes| Restart Rails app running under Phusion Passenger by touching restart.txt"
    task :restart, :roles => :app do
      run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    end

    desc "|DarkRecipes| Inspect Phusion Passenger's memory usage."
    task :memory, :roles => :app do
      run "#{try_sudo} passenger-memory-stats"
    end

    desc "|DarkRecipes| Inspect Phusion Passenger's internal status."
    task :status, :roles => :app do
      run "#{try_sudo} passenger-status"
    end
  end
  namespace :deploy do
    task :start do ; end
    task :stop do ; end
    task :restart, :roles => :app, :except => { :no_release => true } do
      passenger.restart
    end
  end
end