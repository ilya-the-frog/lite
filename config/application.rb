require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    Raven.configure do |config|
      config.dsn = 'https://6c7754fe0a03455e8273d457e60382f5:204ae7e49664417da639be9de26f6f24@sentry.io/4829428'
      config.environments = %w[production]
      config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
