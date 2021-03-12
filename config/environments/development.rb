Rails.application.configure do

  require 'dotenv'
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  # config.active_storage.service = :local

  # config.active_storage.service = :amazon
  ##

  config.mailer_sender = 'noreply@artdiver.org'
  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false

  config.action_mailer.default_url_options = { host: 'localhost:4001' }
  Dotenv.load
  config.action_mailer.delivery_method = :aws_sdk
  config.action_mailer.smtp_settings = {
    address: 'email-smtp.ap-northeast-1.amazonaws.com',
    port: 587,
    user_name: ENV['SES_SMTP_USER'],
    password: ENV['SES_SMTP_PASSWORD'],
    domain: 'artdiver.org',
    authentication: 'login',
    enable_starttls_auto: true
  }


  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true


  # Raises error for missing translations.
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  Rails.application.routes.default_url_options[:host] = 'localhost'
  Rails.application.routes.default_url_options[:port] = 4001
end
