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
# use `send(:warn, ...)` to maintain compatibility with Rails 8+ where `warn`
# is private.
#
# Example:
#   JSONAPI::CompatibilityHelper.deprecation_warn("This feature is deprecated.")

module JSONAPI
  module CompatibilityHelper
    def deprecation_warn(message)
      if ActiveSupport::Deprecation.respond_to?(:warn) && ActiveSupport::Deprecation.public_method_defined?(:warn)
        ActiveSupport::Deprecation.warn(message)
      else
        ActiveSupport::Deprecation.send(:warn, message)
      end
    end
    module_function :deprecation_warn
  end
end
