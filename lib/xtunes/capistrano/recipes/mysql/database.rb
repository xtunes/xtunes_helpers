# Capistrano database.yml task
# Modified from http://gist.github.com/2769

unless Capistrano::Configuration.respond_to?(:instance)
  abort "This extension requires Capistrano 2"
end

Capistrano::Configuration.instance.load do

  namespace :deploy do

    namespace :db do

      desc <<-DESC
        Creates the database.yml configuration file in shared path.

        By default, this task uses a template unless a template \
        called database.yml.erb is found either is :template_dir \
        or /config/deploy folders. The default template matches \
        the template for config/database.yml file shipped with Rails.

        When this recipe is loaded, db:setup is automatically configured \
        to be invoked after deploy:setup. You can skip this task setting \
        the variable :skip_db_setup to true. This is especially useful \
        if you are using this recipe in combination with \
        capistrano-ext/multistaging to avoid multiple db:setup calls \
        when running deploy:setup for all stages one by one.
      DESC
      task :setup, :except => { :no_release => true } do

        default_template = File.read(templates_path + '/database.yml.erb')

        location = fetch(:template_dir, 'config/deploy') + '/database.yml.erb'

        template = File.file?(location) ? File.read(location) : default_template

        config = ERB.new(template)

        run "mkdir -p #{shared_path}/db"
        run "mkdir -p #{shared_path}/config"
        put config.result(binding), "#{shared_path}/config/database.yml"
      end

      desc <<-DESC
        [internal] Updates the symlink for database.yml file to the just deployed release.
      DESC
      task :symlink, :except => { :no_release => true } do
        run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      end

    end

    after "deploy:setup",           "deploy:db:setup"   unless fetch(:skip_db_setup, false)
    after "deploy:finalize_update", "deploy:db:symlink"

  end

  require 'securerandom'

  namespace :mysql do
    desc <<-DESC
      Create MySQL database and user for this environment using prompted values
    DESC
    task :setup do
      set :default_name, application.gsub(/[^\w]/,'_')[0..16]
      set :root_password, Capistrano::CLI.password_prompt("MySQL root password: ")
      set :db_user, Capistrano::CLI.ui.ask("Application database user: ") {|q|q.default = default_name}
      set :db_pass, Capistrano::CLI.password_prompt("Password: (leave blank to generate a random password)")
      set :db_pass, SecureRandom.hex(16) if db_pass == nil || db_pass.length == 0
      set :db_name, Capistrano::CLI.ui.ask("Database name: ") {|q|q.default = default_name}

      sql = <<-SQL
      CREATE DATABASE IF NOT EXISTS #{db_name};
      GRANT ALL PRIVILEGES ON #{db_name}.* TO #{db_user}@localhost IDENTIFIED BY '#{db_pass}';
      SQL

      run "mysql --user=root -p --execute=\"#{sql}\"" do |channel, stream, data|
        if data =~ /^Enter password:/
          channel.send_data "#{root_password}\n"
        end
      end

      set :new_mysql_database_created, true
    end
  end

  before 'deploy:db:setup' do
    mysql.setup if Capistrano::CLI.ui.agree("Create mysql database on server? [Yn]")
  end

  on :exit do
    if fetch(:new_mysql_database_created,false)
      puts "======================================="
      puts "* database: #{db_name}"
      puts "* username: #{db_user}"
      puts "* password: #{db_pass}"
      puts "======================================="
    end
  end

end