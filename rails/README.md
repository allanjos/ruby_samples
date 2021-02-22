# news-backend-rails sample

## Build

Update yarn packages:

    yarn install --check-files

Build:

    bundle install
    bundle install --path vendor/bundle

Update bundler when needed:

    gem update bundler

## Run

Run application:

    rails s

## Configuration

Created with the commands:

    rails new news-backend-rails

    cd news-backend-rails

On Fedora is needed to install nokogiri gem using system libraries with the command:

    gem install nokogiri -- --use-system-libraries

Model was created with the command:

    rails generate model news title:string content:text author:string
    rails db:migrate

Controller to list news was created with the command:

    rails generate NewsList