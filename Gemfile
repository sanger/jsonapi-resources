source 'https://rubygems.org'

gemspec

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
end

version = ENV['RAILS_VERSION'] || 'default'
# If version is like 'x.y' add a '.0' to make it 'x.y.0' for correct resolution
version = "#{version}.0" if version =~ /^\d+\.\d+$/

platforms :ruby do
  gem 'pg'
  gem 'mysql2'
  gem 'sqlite3'
  gem 'csv'
end

case version
when 'master'
  gem 'railties', { git: 'https://github.com/rails/rails.git' }
  gem 'arel', { git: 'https://github.com/rails/arel.git' }
when 'default'
  gem 'railties', '~> 8.1.0'
else
  gem 'railties', "~> #{version}"
end
