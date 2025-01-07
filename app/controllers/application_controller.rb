class ApplicationController < ActionController::Base
  # Validação personalizada para navegadores (se allow_browser for parte de uma gem ou middleware)
  # Confirme que essa funcionalidade está configurada corretamente.
  # Caso contrário, comente ou remova esta linha.
  allow_browser versions: :modern if respond_to?(:allow_browser)

  # Configura o redirecionamento após logout (Devise)
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # Configura parâmetros permitidos para Devise (caso esteja usando)
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Permite parâmetros adicionais para Devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
  end
end
