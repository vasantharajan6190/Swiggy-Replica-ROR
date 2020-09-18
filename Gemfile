source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rails', '~> 5.1.7'
gem 'puma', '~> 3.7'
gem 'sqlite3', '~>1.3.6'
gem 'twilio-ruby', '~> 5.39.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'user_management_rails'
gem 'geocoder', '~> 1.6', '>= 1.6.3'
gem 'turbolinks', '~> 5'
gem 'nexmo'
gem 'dotenv-rails', groups: [:development, :test]
gem 'jbuilder', '~> 2.5'
gem 'devise', '~> 4.7', '>= 4.7.2'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
end
group :development do
  gem 'web-console', '>= 3.3.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]