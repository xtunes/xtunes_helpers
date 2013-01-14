unless Capistrano::Configuration.respond_to?(:instance)
  abort "This extension requires Capistrano 2"
end

Capistrano::Configuration.instance.load do
	on :load do
		if is_using('mysql',:database)
			require File.join(File.dirname(__FILE__), 'mysql/database')
		end

		# User settings
		set :user, 'webadmin'   unless exists?(:user)
		set :group,'www-data' unless exists?(:group)

		# Server settings
		set :app_server, :passenger       unless exists?(:app_server)
		set :web_server, :nginx         unless exists?(:web_server)
		set :runner, user               unless exists?(:runner)
		set :application_port, 80       unless exists?(:application_port)

		set :application_uses_ssl, false unless exists?(:application_uses_ssl)
		set :application_port_ssl, 443  unless exists?(:application_port_ssl)

		# Database settings
		set :database, :mysql unless exists?(:database)

		# SCM settings
		set :scm, :git
		set :branch, 'master' unless exists?(:branch)
		set :deploy_to, "/opt/rails-apps/#{application}" unless exists?(:deploy_to)
		set :deploy_via, :remote_cache
		set :keep_releases, 3
		# set :git_shallow_clone, 1
		#set :git_enable_submodules, true
		set :rails_env, 'production' unless exists?(:rails_env)
		set :use_sudo, false

		# Git settings for capistrano
		default_run_options[:pty] = true
		ssh_options[:forward_agent] = true

		# Daemons settings
		# The unix socket that unicorn will be attached to.
		# Also, nginx will upstream to this guy.
		# The *nix place for socks is /var/run, so we should probably put it there
		# Make sure the runner can access this though.
		#set :sockets_path, "/var/run/#{application}" unless exists?(:sockets_path)

		# Just to be safe, put the pid somewhere that survives deploys. shared/pids is
		# a good choice as any.
		#set(:pids_path) { File.join(shared_path, "pids") } unless exists?(:pids_path)

		#set :monitorer, 'bluepill' unless exists?(:monitorer)

		# Application settings
	end
end