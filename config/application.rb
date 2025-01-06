require_relative "boot"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlogMaino
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Adiciona o diretório lib ao autoload_paths
    config.autoload_paths += %W[#{config.root}/lib]

    # Fuso horário (time zone)
    config.time_zone = "Brasilia"  # Define o fuso horário para Brasília (GMT-3)
    config.active_record.default_timezone = :local  # Armazena as datas no banco de dados no fuso horário local

    # Internacionalização
    config.i18n.default_locale = :"pt-BR" # Define o idioma padrão (exemplo: português)
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}").to_s] # Carrega os arquivos de tradução
    config.i18n.fallbacks = true # Habilita fallback para quando a tradução não for encontrada

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
