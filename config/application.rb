require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CodebymeSite
  class Application < Rails::Application


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Indiana (East)'
    config.action_mailer.delivery_method = :mailgun
    config.action_mailer.mailgun_settings = {
          api_key: ENV["MAILGUNAPIKEY"],
          domain: 'mg.codebyme.com'
          }
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.assets.paths << Rails.root.join("app", "assets", "startup-framework")
    config.assets.paths << Rails.root.join("app/assets/startup-framework/common-files/javascripts/")
    config.assets.paths << Rails.root.join("app/assets/startup-framework/flat-ui/js/")
    config.assets.paths << Rails.root.join("app/assets/startup-framework/common-files/css/")
    config.assets.paths << Rails.root.join("app/assets/startup-framework/flat-ui/bootstrap/css/")
    config.assets.paths << Rails.root.join("app/assets/startup-framework/flat-ui/css/")
    config.assets.paths << Rails.root.join("app/assets/startup-framework/flat-ui/fonts/")
  end
end
