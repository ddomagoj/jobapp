# README

# JobTracker
## The best job tracker ever
#


To start docker postgres container:

```sh
docker run --name rails_app -e POSTGRES_PASSWORD=password -d -p 5432:5432 <image name>
```
username: default username - postgres
password: password

To start mailhog:

```sh
docker run -p 8025:8025 -p 1025:1025 mailhog/mailhog
```
display at: http://localhost:8025

After cloning repo:

```sh
rails db:setup
```

```sh
rails db:seed RAILS_ENV=test
```

Users:
user1 - username: ddespala@gmail.com, password: 111111
user2 - username: test@test.com, password: 111111
       
To start tests

```sh
bundle exec rspec
```

Pozdrav!
