source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.1.4', '>= 6.1.4.3'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'pagy', '~> 5.6'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0.0'
  gem 'shoulda-matchers', '~> 5.0.0'
  gem 'factory_bot', '~> 6.2.0'
end

group :development do
  gem 'listen', '~> 3.3'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
