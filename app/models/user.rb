class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  validates :name, presence: { message: "não pode ficar em branco" }
  validates :email, presence: true, uniqueness: { case_sensitive: false, message: "já está em uso" }
end
