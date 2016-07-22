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
