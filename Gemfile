source 'https://rubygems.org'

ruby '2.3.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'

group :development, :test do
    gem 'sqlite3'
end

group :production do
    gem 'pg'
end

gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'jquery-rails'
gem 'rails-assets-tether'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'bootstrap_form'
gem "paperclip", "~> 5.0.0"
gem 'aws-sdk', '~> 2.3.0'
gem 'prism-rails'
gem 'acts-as-taggable-on', github: 'mbleigh/acts-as-taggable-on'
gem 'mail_form'
gem 'sendgrid-ruby'
gem 'friendly_id', '~> 5.1.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
