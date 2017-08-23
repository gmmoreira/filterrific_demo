require 'pathname'

God.watch do |w|
  w.name         = 'sneakers'
  w.dir          = Pathname.pwd
  w.start        = 'bundle exec rake sneakers:run'

  w.stop_signal  = 'TERM'
  w.stop_timeout = 90.seconds

  w.restart_signal  = 'TERM'
  w.restart_timeout = 90.seconds

  w.log          = Pathname.pwd + 'log/sneakers.log'
  w.keepalive
end