#!/bin/bash

sudo apt-get install postgresql postgresql-contrib libpq-dev

echo "create a user for postgres\n"
echo "sudo su - postgres\ncreateuser --pwprompt\nexit"
