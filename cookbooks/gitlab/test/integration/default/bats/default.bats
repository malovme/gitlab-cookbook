#!/usr/bin/env bats

@test 'unicorn rails is listening on gitlab.socket' {
  test -S /srv/git/gitlab/tmp/sockets/gitlab.socket
}

@test 'redis-server is running' {
  pgrep redis-server
}

@test 'mysql schema is initialized and has projects* tables' {
  echo 'show tables;' | mysql -h 127.0.0.1 -u root --password='test' gitlab | grep 'projects'
}

@test 'nginx is running' {
  pgrep nginx 
}

@test 'nginx is listening on :80' {
  netstat -lnp | grep ':80' | grep 'nginx'
}
