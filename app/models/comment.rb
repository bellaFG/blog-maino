class Comment < ApplicationRecord
  validates :arthur, :body, presence: true
  belongs_to :article
end
