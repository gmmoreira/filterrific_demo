require 'sneakers'
require 'sneakers/handlers/maxretry'

Sneakers.configure(workers: 4, timeout_job_after:60)

Sneakers.logger.level = Logger::INFO
