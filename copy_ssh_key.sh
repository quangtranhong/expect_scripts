#!/usr/bin/expect -f
# wrapper to make passwd(1) be non-interactive
# username is passed as 1st arg, passwd as 2nd

set server_ip [lindex $argv 0]
set password [lindex $argv 1]

spawn ssh-copy-id -i ~/.ssh/id_rsa.pub $server_ip
expect "continue"
send "yes\r"
expect "assword:"
send "$password\r"
expect eof
