sudo apt-get install language-pack-en
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo "deb http://pkg.jenkins-ci.org/debian binary/" | sudo tee -a /etc/apt/sources.list.d/jenkins.list
sudo apt-get update -y
sudo apt-get install jenkins -y
echo "Checking if jenkins is running...."
ps -ef | grep jenkins
echo "Installing apache web server..."
sudo apt-get install apache2 -y
echo "enabling proxy..."
sudo a2enmod proxy
echo "enabling proxy_http..."
sudo a2enmod proxy_http

# configure apache to proxy the http request received at port 80 to port 8080
# sudo nano /etc/apache2/sites-available/jenkins.conf and change the hostname to the appropreate public dns or public ip
# Put the following configuration in the jenkins.conf file
#<VirtualHost *:80>
#    ServerName HOSTNAME
#    ProxyRequests Off
#    <Proxy *>
#        Order deny,allow
#        Allow from all
#    </Proxy>
#    ProxyPreserveHost on
#    ProxyPass / http://localhost:8080/
#</VirtualHost>

# Now enable the configuration we have just created
# sudo a2ensite jenkins
echo "Restarting apache web server..."
sudo service apache2 reload


###### Troubleshooting #######
# run following command to check which port are listening
# netstat -tlpn
# If port 8080 is not listening than run the start the jenkins server by the following command
#  sudo /etc/init.d/jenkins start

