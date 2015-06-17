This is a simple API to store prospects informations and send content via email.

# Features:

* It stores the prospect email.
* It stores any additional data in a JSON.
* It can categorize prospects by a list name.
* It sends automated email to the prospect.

## Development

### config the database
`$ rake db:create`  
`$ rake db:migrate`

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
