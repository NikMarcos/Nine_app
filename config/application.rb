require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NineApp
  class Application < Rails::Application
      # Initialize configuration defaults for originally generated Rails version.
      config.load_defaults 5.2
      I18n.default_locale = :en
      config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
