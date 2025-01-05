class User < ApplicationRecord
  # Remova essa linha que é específica do Devise
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Se você tiver outros atributos ou validações, mantenha-os
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
