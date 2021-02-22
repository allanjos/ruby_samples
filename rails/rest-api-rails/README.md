# news-backend-rails sample

## Build

Update yarn packages:

    yarn install

Build:

    bundle install --path vendor/bundle

Update bundler when needed:

    gem update bundler

## Configuration

Create database:

    rake db:migrate

Populate initial data:

    rake db:seed

## Run

Run application:

    rails s