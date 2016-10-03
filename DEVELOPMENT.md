# Development

## CI

[![Build Status](https://travis-ci.org/binti-family/MDHS_trial.svg?branch=master)](https://travis-ci.org/binti-family/MDHS_trial)

## Getting Started

1. [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/) (we use v2.3.1)

2. [Install Bundler](http://bundler.io/#getting-started)

3. [Install Phantomjs](http://phantomjs.org/) (only needed for running automated tests)
```
gem install bundler
```

3. Install [PostgreSQL](https://www.postgresql.org/download/) and [PostGIS](http://postgis.net/install/)

4. Clone the app and enter its directory

```
git clone git@github.com:binti-family/MDHS_trial.git
cd MDHS_trial
```

5. Install Rails and other Ruby gems:

```
bundle install
```

6. Setup your database

```
rake db:setup
```

7. Run the tests

```
rake
```

8. Load and geocode the facilities data

```
rake import_providers
rake geocode_providers
```

9. Run the development server

```
rails s
```

You can visit the development site at [http://localhost:3000](http://localhost:3000)

## Deployment

This is a conventional Rails app. We deployed our live instance to [Heroku](https://www.heroku.com/), but nearly any cloud vendor should support this app.
