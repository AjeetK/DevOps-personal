Continuous Integration using jenkins
Team works on a project
They code individually and tested individually
When they integrate them, everything breaks
This gives rise to integratin hell

consequencies of integration hell
Risky for the project
May exceed the budget
May exceed the schedule

Continuous Integration is based on the philosophy of "Integrate early and Integrate often" i.e. on every change
Benefits of a CI server
Developers might forget to run the tests
It might take too long to run the tests
We might need to test the code in various environments
Reports provide useful insights
Can deploy automatically

Refer to this script to setup jenkins server
After setting up the jenkins server, head over the url to see jenkins server running in the browser
Click on "Manage jenkins"
Go to "Configure globle security" option check "enable security" checkbox
In the side bar menu "Access Control" select the option "jenkin's own user database"
And uncheck the option "Allow users to sign up". This is because, we don't want users to signup explicitly for security purpose.
Select the option "Logged in user can do anything", as we have only one user.
Than click on "save" button.

This will save the setting we have done so far. Now the signup form gets open. We have disabled the option for signup but jenkins allows to signup for the first time for one user.
Fill the details for the first user.
Hit signup button and you are logged in

Now Go to "Manage plugin" option from "Manage jenkins" link
Update the installed plugin and than go to "available plugin" tab.
If you don't see any plugin available, go to "Advanced tab" and click on "check now" button.
From the available plugin search for the github pluging.
check the "GitHub plugin" and than click on "Download and install after restart" button.
Than check the option "Restart jenkins when installation is complete and no jobs are remaining"
This will restart the jenkins after downloading the plugins
Now you will be redirected to login page

Next setup is to login to the jenkins server 
get logged in as jenkins user
ubuntu@ip-10-0-0-241:~$ sudo su - jenkins
This will create a user jenkins in the directory /var/lib/jenkins

Create a .gitconfig in the home directory (/var/lib/jenkins)

[user]
  name = Jenkins
  email = jenkins@localhost


jenkins@ip-10-0-0-241:~$

Now as a jenkins user install rvm and ruby
Install any dependencies specific to your application (e.g., databases, task queues, system tools)

OPTIONAL: If you plan to access repositories that require authentication (e.g., private GitHub repos), you may want to create a public-private key pair for use with SSH.

ssh-keygen

add the generated key to the github repo



Install Plugins. From the root page, click “Manage Jenkins” then “Manage Plugins”. From the “Available” tab, check the following plugins:

    Git

    GitHub

    rbenv

    Rake



Configure your project

Next, I'll configure our Rails project.

    From the home page, click on “New Item”, then select “Build a free-style software project” and click “OK”.

    Fill in the “Project Name” and “GitHub project” fields.

    Under “Source Code Management”, select “Git” and fill in the repo url. (If you need to authenticate with SSH, configure that here.)


    Check the “rbenv build wrapper” box.

    Add the ci_reporter gem to your project’s Gemfile and follow the instructions in the gem’s README to install. This is used to generate JUnit-style XML reports that can be read by Jenkins from the Rspec results.

    Under “Add build step”, select “Execute shell”. A typical Rails app might look like this:

    cp config/database.yml.example config/database.yml
    bundle install
    rake db:create
    rake db:schema:load
    rake db:test:prepare
    rake ci:setup:rspec spec RAILS_ENV=test

Make sure the database is configured properly. If you need a special database.yml, you can store this in Jenkins’ home directory.

    OPTIONAL: To make sure you know when a build fails, set up email notifications (under “Add post-build action”). Configure SMTP on the “Configure System” page, found under “Manage Jenkins”. See the Jenkins wiki for an easy Gmail setup: https://wiki.jenkins-ci.org/display/JENKINS/GMail.

    Try out your build by clicking “Build Now”.
GitHub Integration

Finally, I'll set up the GitHub integration, so that a push triggers a new build in Jenkins.

    Navigate to “Webhooks & Services” under “Settings” on the GitHub repository page. You’ll need to be a repo admin to do this.

    Jenkins Webhook Setup

    Click “Configure services” and select the “Jenkins (GitHub plugin)” option.

    Enter the address to your Jenkins server followed by /github-webhook/, check “Active” and update your settings.

    That’s it. Try it out by pushing a commit to GitHub and verifying that a new build is triggered in Jenkins.


