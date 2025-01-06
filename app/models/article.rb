class Article < ApplicationRecord
  include PgSearch
  extend FriendlyId

  validates :title, :body, :author, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  friendly_id :title, use: :slugged

  pg_search_scope :search,
  against: %i[title author body],
  associated_against: { comments: %i[body] }
end
