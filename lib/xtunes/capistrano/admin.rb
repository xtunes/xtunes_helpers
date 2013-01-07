unless Capistrano::Configuration.respond_to?(:instance)
  abort "This extension requires Capistrano 2"
end

Capistrano::Configuration.instance.load do
	desc "tail production log files"
	task :tail_logs, :roles => :app do
	  run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
	    puts  # for an extra line break before the host name
	    puts "#{channel[:host]}: #{data}"
	    break if stream == :err
	  end
	end
end