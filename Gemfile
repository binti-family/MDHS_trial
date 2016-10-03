source "https://rubygems.org"

ruby "2.3.1"

gem "rails", "4.2.6"
gem "pg", "~> 0.15"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "jquery-rails"
gem "geocoder"
gem "activerecord-postgis-adapter"
gem "dotenv-rails"
gem "puma"

group :development, :test do
  gem "pry-rails"
  gem "rspec-rails"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "guard"
  gem "guard-rspec"
  gem "guard-livereload"
  gem "rack-livereload"
  gem "quiet_assets"
end

group :test do
  gem "factory_girl_rails"
  gem "poltergeist"
  gem "database_cleaner"
  gem "faker"
end

group :production do
  gem "rails_12factor"
end
