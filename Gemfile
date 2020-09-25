source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "bootsnap", ">= 1.4.2", require: false
gem "mongoid", "~> 7.1", ">= 7.1.2"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.3", ">= 6.0.3.3"

group :development, :test do
  gem "pry-rails", "~> 0.3.9"
end

group :development do
  gem "listen", "~> 3.2", ">= 3.2.1"
  gem "overcommit", "~> 0.55.0"
  gem "rubocop", "~> 0.80.1"
  gem "rubocop-performance", "~> 1.5", ">= 1.5.2"
  gem "spring", "~> 2.1", ">= 2.1.1"
  gem "spring-watcher-listen", "~> 2.0", ">= 2.0.1"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
