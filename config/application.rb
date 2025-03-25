require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module LeaveManagementApp
  class Application < Rails::Application
    config.load_defaults 8.0

    Dotenv::Railtie.load if defined?(Dotenv)
    
    # Ensure sessions work with Devise
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.session_store :cookie_store, key: '_leave_management_session'

    # Uncomment this line to ensure it's not running as an API-only app
    config.api_only = false
  end
end
