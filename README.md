This is a simple API to store contacts informations and send automated emails.  

You can use this API to store leads or prospects informations and send content via email,  
for example you can have a landing page allowing a lead to receive an ebook on his email.  

# Features:

* It stores the contact email and additional data.
* It organizes contacts by list name.
* It can send an automated email to the contact.

## API

* **POST /contact**  
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

### create your custom deploy config
`$ cp config/deploy/production.sample.conf config/deploy/production.conf`  
`$ cp config/deploy/staging.sample.conf config/deploy/staging.conf`  

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
