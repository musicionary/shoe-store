Shoe Distribution
Write a program to track shoe brands and what stores they are in. Here are the user stories:

CRUD:
As a user, I want to be able to add, update, delete and list shoe stores.
As a user, I want to be able to add shoe brands in the application (don't worry about updating, listing or destroying shoe brands).
As a user, I want to be able to add shoe brands to a store to show where they are sold.

Views:
As a user, I want to be able to see all of the brands a store sells on the individual store page.

Callbacks:
As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
The project includes least one functional callback.

Validations:
As a user, I do not want stores and shoes to be saved if I enter a blank name.
The project includes at least one functional validation.


Further Exploration
Add styling and images to your site for an improved user experience
Complete CRUD functionality for shoe brands


# _Shoe Store_

##### This application is a shoe francise site where the user can create various stores, add shoe brands to stores, and view brands by location. The application is made to showcase what we have learned about databases, Active Record, and Ruby with Sinatra as of now.

## Technologies Used

Application: Ruby, Sinatra, ActiveRecord<br>
Testing: RSpec, Capybara, ActiveRecord<br>
Database: Postgres
Framework: Materialize CSS

Installation
------------

First clone the repository.  
```
$ git clone https://github.com/musicionary/shoe-store.git
```

Install required gems:
```
$ bundle install
```

Use rake to setup your database:
```
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
```

Start the webserver:
```
$ ruby app.rb
```

Open `localhost:4567` in browser.

License
-------

MIT License. Copyright &copy; 2016 "Chip Carnes"
