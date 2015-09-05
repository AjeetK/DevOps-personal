#!/bin/bash

sudo apt-get install postgresql postgresql-contrib libpq-dev

echo "create a user for postgres\n"
echo "sudo su - postgres\ncreateuser --pwprompt\nexit"

# ubuntu$sudo su - postgres
# postgres$psql
# postgres=# CREATE ROLE ajeet WITH CREATEDB SUPERUSER;
# \du to list role 

# set postgresql role passoword as follows
# create user foo unencrypted password 'foopassword';
# create user bar encrypted password 'foopassword';
# select usename,passwd from pg_shadow where usename in ('postgres','foo','bar');

# asking postgres for hba file
#ubuntu@ip-10-0-0-241:~$ sudo su - postgres
#postgres@ip-10-0-0-241:~$ SHOW hba_file;
#SHOW: command not found
#postgres@ip-10-0-0-241:~$ psql
#psql (9.3.9)
#Type "help" for help.

#postgres=# SHOW hba_file;
#               hba_file               
#--------------------------------------
# /etc/postgresql/9.3/main/pg_hba.conf
#(1 row)

#If peer authentication fails error is diplayed on console of jenkins server than edit the pg_hba.conf file content to
# $sudo nano /etc/postgresql/9.3/main/pg_hba.conf 
# "local" is for Unix domain socket connections only
# local   all             all                                     md5


