source 'http://rubygems.org'

gem 'rails', '3.0.10'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :linux do
  gem 'pg'
end

group :mac do
  gem 'sqlite3-ruby', ">= 1.3.3", :require => 'sqlite3'
end


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

# REFINERY CMS ================================================================


# *****************************************************************************

# Specify the Refinery CMS core:
gem 'refinerycms',              '~> 1.0.9'
# gem 'refinerycms-generators'


group :test do

  # Autotest
  gem 'ZenTest'
  gem 'autotest'
  gem 'autotest-inotify'
  gem 'autotest-rails'
  gem 'rb-inotify'
  gem 'autotest-notification'
  gem 'redgreen'

  # Cucumber
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'launchy'
  gem 'gherkin'
  gem 'spork'       unless Bundler::WINDOWS
  gem 'rack-test'
  gem 'json_pure'

  # Factory Girl
  gem 'factory_girl'
  gem "#{'j' if RUBY_PLATFORM == 'java'}ruby-prof" unless defined?(RUBY_ENGINE) and RUBY_ENGINE == 'rbx'

  # other
  gem 'tzinfo'
  gem 'mail'
  gem 'columnize'
  gem 'thor'
  gem 'taps'

end

group :development do
  gem 'heroku'
  gem 'mongrel', "1.2.0.pre2"
  
  # RSpec
  gem 'rspec-rails'

end
# END REFINERY CMS ============================================================

# USER DEFINED
gem 'haml'
gem 'sass'

#  gem 'dalli'   # used for heroku memcache

# Specify additional Refinery CMS Engines here (all optional):
# gem 'refinerycms-portfolio',  '~> 0.9'
# gem 'refinerycms-theming',    '~> 0.9'

gem 'refinerycms-inquiries',    '~> 1.0'
gem 'refinerycms-page-images'
gem 'refinerycms-news', :git => 'git://github.com/dsaronin/refinerycms-news', :branch => 'master'
gem 'refinerycms-blog', :git => 'git://github.com/dsaronin/refinerycms-blog', :branch => 'master'
gem 'refinerycms-galleries', :require => 'galleries', :git => 'git://github.com/dsaronin/refinerycms-galleries', :branch => 'master'
gem 'refinerycms-mailchimp'

# gem 'banner-rotator', :git => 'git@github.com:AlexisMasters/banner-rotator.git', :branch => 'master'
# gem 'banner-rotator', :git => 'git://github.com/dsaronin/banner-rotator.git', :branch => 'master'

# Add i18n support (optional, you can remove this if you really want to).
gem 'refinerycms-i18n',         '~> 1.0.0'

gem "recaptcha", :require => "recaptcha/rails"
gem 'seo_meta'
gem 'fog'

# END USER DEFINED

gem 'refinerycms-daily_quotes', '1.0', :path => 'vendor/engines'

gem 'rest-client'
gem 'refinerycms-event_calendars', '1.0', :path => 'vendor/engines'
