require 'sneakers'
require 'sneakers/handlers/maxretry'

# :runner_config_file => nil,  # A configuration file (see below)
# :metrics => nil,             # A metrics provider implementation
# :daemonize => true,          # Send to background
# :start_worker_delay => 0.2,  # When workers do frenzy-die, randomize to avoid resource starvation
# :workers => 4,               # Number of per-cpu processes to run
# :log  => 'sneakers.log',     # Log file
# :pid_path => 'sneakers.pid', # Pid file
# :timeout_job_after => 5,      # Maximal seconds to wait for job
# :prefetch => 10,              # Grab 10 jobs together. Better speed.
# :threads => 10,               # Threadpool size (good to match prefetch)
# :env => ENV['RACK_ENV'],      # Environment
# :durable => true,             # Is queue durable?
# :ack => true,                 # Must we acknowledge?
# :heartbeat => 2,              # Keep a good connection with broker
# :exchange => 'sneakers',      # AMQP exchange
# :hooks => {}                  # prefork/postfork hooks
# :start_worker_delay => 10     # Delay between thread startup

Sneakers.configure(workers:           2,
                   timeout_job_after: 2)

Sneakers.logger.level = Logger::INFO
