This is a simple API to store prospects informations and send content via email.

# Features:

* It stores the prospect email.
* It stores any additional data in a JSON.
* It can categorize prospects by a list name.
* It sends automated email to the prospect.

## API

* **POST /prospects**  
  required params: email, list_name  
  optional params: data (JSON)  

## Development

### config the database
`$ cp config/database.sample.yml config/database.yml`
`$ rake db:create`  
`$ rake db:migrate`

### config the mail
`$ cp config/mail.sample.yml config/mail.yml`

### run the console
`$ rake console`

### run the app with
`$ rackup`

## test

### config the database
`$ rake RACK_ENV=test db:create`  
`$ rake RACK_ENV=test db:migrate`

### run the tests
`$ rspec`


# TODO

* Move mail config to the database?
