# frozen_string_literal: true

# JSONAPI::CompatibilityHelper
#
# This module provides a version-safe method for issuing deprecation warnings
# that works across multiple versions of Rails (7.x, 8.x, etc).
#
# Usage:
#   JSONAPI::CompatibilityHelper.deprecation_warn("Your deprecation message")
#
# The method will use the public `warn` method if available, otherwise it will
# use Rails 8+ style deprecation warnings.
#
# Example:
#   JSONAPI::CompatibilityHelper.deprecation_warn("This feature is deprecated.")

module JSONAPI
  module CompatibilityHelper
    def deprecation_warn(message)
        ActiveSupport::Deprecation.new(nil, 'JSONAPI').warn(message)
    end
    module_function :deprecation_warn
  end
end
