#cloud-config
runcmd:
  - echo '<h1>Welcome to ${asg}</h1>' | tree -a /var/www/html/index.html
  - chkconfig httpd on
  - service httpd start