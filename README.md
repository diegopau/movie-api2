# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 3.0.0

* Rails version: 6.1.0

* System dependencies
** Database: postgresql

* Configuration

* Database creation
** rails db:create
** rails db:migrate
** rails db:seed

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


APIs Details:
* user login/create user/get user's movies:
** type: post
** url: http://movies-api.com/api/v1/users?username=username

* mark/unmark movies as favorite
** type: put/patch
** url: http://movies-api.com/api/v1/movies?username=username&movie_id=1&favorited=true