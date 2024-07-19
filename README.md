# README

This is just a simple web scraper of this website https://news.ycombinator.com/, able to collecting, processing and displaying this data on a table in its main view.
It also includes two buttons with the functionality of sorting that data, as well as six functional tests to try those buttons and the own application flow.

* Ruby version 

  -3.3.3

* Ruby on Rails version

  -7.1.3

* System dependencies

  -TailwindCSS as CSS framework.

  -Nokogiri for parsing XML and HTML.

  -RSpec, FactoryBotRails, Faker for testing.

* Database

  -SQLite, default Ruby on Rails DB.

* How to run the test suite

  -Run "bundle exec rspec" command.

* Deployment instructions

  1. Clone the project, run "git clone https://github.com/piavolo/hacker-news-crawler.git" command.
  2. Run "cd hacker-news-crawler" command.
  3. Run "bundle install" command to configure dependences.
  4. Run "rails db:migrate" command to execute database migration.
  5. Run "bin/dev" command to set and get up the server.
  6. Check this url in your browser "http://localhost:3000/".
