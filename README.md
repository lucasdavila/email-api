This is a simple API to store prospects informations and send content via email.

# Features:

* It stores the prospect email.
* It stores any additional data.
* It can categorize prospects by a list name.
* It sends automated email to the prospect.

## API

* **POST /prospects**  
  required params: email, list_name  
  optional params: data (postgres hstore)  

## First steps

### create your custom configs
`$ cp config/mail.sample.yml config/mail.yml`  
`$ cp config/database.sample.yml config/database.yml`

## Test

### setup the database
`$ rake RACK_ENV=test db:create`  
`$ rake RACK_ENV=test db:migrate`

### run the tests
`$ rspec`

## Development

### setup the database
`$ rake db:create`  
`$ rake db:migrate`

### run the console
`$ rake console`

### run the app with
`$ rackup`

## Production

### create your custom apache virtual host
`$ cp config/apache.sample.conf config/apache.conf`

### upload your custom virtual host
`$ cap production upload:vhost`

### upload your custom configs
`$ cap production upload:db_config`  
`$ cap production upload:mail_config`

### deploy it
`$ cap production deploy`

### setup the database
`$ cap production db:create`  
`$ cap production db:migrate`  

Yay, your API is online :D
