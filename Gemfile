source 'http://rubygems.org'

gem 'rails', '3.0.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

# REFINERY CMS ================================================================

# Specify the Refinery CMS core:
gem 'refinerycms',              '= 0.9.8.9'

# Specify additional Refinery CMS Engines here (all optional):
gem 'refinerycms-inquiries',    '~> 0.9.9.2'
gem 'refinerycms-news', :git => 'git://github.com/dsaronin/refinerycms-news', :branch => 'master'
# gem 'refinerycms-portfolio',  '~> 0.9.8'
# gem 'refinerycms-theming',    '~> 0.9.8'

gem 'refinerycms-blog', :git => 'git://github.com/dsaronin/refinerycms-blog', :branch => 'master'
gem 'refinerycms-galleries', :require => 'galleries', :git => 'git://github.com/dsaronin/refinerycms-galleries', :branch => 'master'

# Add i18n support (optional, you can remove this if you really want to).
gem 'refinerycms-i18n',         '~> 0.9.8.9'

# Figure out how to get RMagick:
rmagick_options = {:require => false}
rmagick_options.update({
  :git => 'git://github.com/refinerycms/rmagick.git',
  :branch => 'windows'
}) if Bundler::WINDOWS

# Specify a version of RMagick that works in your environment:
gem 'rmagick',                  '~> 2.12.0', rmagick_options

gem 'authlogic'

# END REFINERY CMS ============================================================

# USER DEFINED
gem 'haml'
gem 'tzinfo'
gem 'mongrel'

# END USER DEFINED
