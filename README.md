#install gem 
bundle install 

#ruby version 
rbenv install 2.5.1

#edit database.yml
edit the database configuration as required.

#Create and setup the database 
rails db:create 
rails db:migrate 

#Download ngrok, public URL for testing
https://ngrok.com/download

#Start ngrok 
./ngrok http 3000

#Run rspec 
.rspec
