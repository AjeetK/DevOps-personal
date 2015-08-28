Uncomment the lines for default server in /etc/nginx/sites-available/default
We can also modify the default index file of nginx to show appropriate message in case our virtual host doesn't work

in /etc/nginx/nginx.conf
uncomment passenger_ruby and replace path by the result of "which ruby" command

place the below configuration in /etc/nginx/sites_available/yourapp
server 
{ listen 80 default_server; 
  server_name ec2-52-76-33-67.ap-southeast-1.compute.amazonaws.com; 
  passenger_enabled on; 
  passenger_app_env development; 
  root /home/ubuntu/myapp/public; 
}

creating symlink for the conf file in sites-enabled directory
sudo ln -s /etc/nginx/sites-available/myapp /etc/nginx/sites-enabled/myapp

$which passenger-config
output - /usr/bin/passenger-config

$rvm use 2.2.1
output - Using /home/ubuntu/.rvm/gems/ruby-2.2.1

$/usr/bin/passenger-config --ruby-command
output -   To use in Nginx : passenger_ruby /home/ubuntu/.rvm/gems/ruby-2.2.1/wrappers/ruby

copy this path in /etc/nginx/nginx.conf in place of passenger_ruby line


