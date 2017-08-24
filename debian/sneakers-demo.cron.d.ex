#
# Regular cron jobs for the sneakers-demo package
#
0 4	* * *	root	[ -x /usr/bin/sneakers-demo_maintenance ] && /usr/bin/sneakers-demo_maintenance
