#!/bin/bash

echo -e "---------------------------------------\nSetting up this container for development! \n\n"
sleep 1

bundle install

echo -e "---------------------------------------\n"
echo -e "Setting up local databases\n"

bundle exec rake db:drop
bundle exec rake db:create db:migrate
bundle exec rake db:seed

echo -e "\n---------------------------------------\n\nFinished! \n\n"

exit 1
