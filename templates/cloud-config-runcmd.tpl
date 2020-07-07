#cloud-config
runcmd:
  - yum install httpd tree -y
  - echo '<h1>Welcome to ${asg}</h1>' > /var/www/html/index.html
  - chkconfig httpd on
  - service httpd start