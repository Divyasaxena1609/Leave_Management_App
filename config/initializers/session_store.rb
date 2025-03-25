# config/initializers/session_store.rb

Rails.application.config.session_store :cookie_store, key: '_leave_management_session', expire_after: 30.minutes
