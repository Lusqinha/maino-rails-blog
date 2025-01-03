require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.enable_reloading = false

  config.eager_load = true

  config.consider_all_requests_local = false

  config.action_controller.perform_caching = true

  config.public_file_server.headers = { "cache-control" => "public, max-age=#{1.year.to_i}" }

  config.active_storage.service = :local

  config.assume_ssl = true
  config.force_ssl = true

  config.log_tags = [ :request_id ]
  config.logger   = ActiveSupport::TaggedLogging.logger(STDOUT)

  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  config.silence_healthcheck_path = "/up"

  config.active_support.report_deprecations = false

  config.action_mailer.default_url_options = { host: ENV["HOST_ADRESS"] }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: ENV["SMTP_ADDRESS"],
    port: ENV["SMTP_PORT"],
    domain: ENV["SMTP_DOMAIN"],
    user_name: ENV["SMTP_USER_NAME"],
    password: ENV["SMTP_PASSWORD"],
    authentication: "plain",
    enable_starttls_auto: true
  }

  config.i18n.fallbacks = true
  config.i18n.default_locale = :'pt_BR'
  config.i18n.available_locales = [ :'pt_BR', :en ]

  config.active_record.dump_schema_after_migration = false
  config.active_record.attributes_for_inspect = [ :id ]
end
