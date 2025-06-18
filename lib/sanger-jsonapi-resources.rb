# As we are packaging 'sanger-jsonapi-resources' as a separate gem, RubyGems expects
# the main file to be 'lib/sanger-jsonapi-resources.rb' to match the gem name.
# Without this file, requiring the gem or Rails autoloading would fail, even if the internal code is unchanged.
# This file exists to ensure compatibility with RubyGems and Bundler.
# The easiest solution is to use this wrapper file, which simply requires the original 'jsonapi-resources' code,
# so all internal references and modules remain unchanged and compatible.
require_relative 'jsonapi-resources'
