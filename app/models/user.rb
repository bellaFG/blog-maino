class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Remova essa linha que é específica do Devise
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :articles
  # Se você tiver outros atributos ou validações, mantenha-os
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
