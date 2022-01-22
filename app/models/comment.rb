class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :text, length: {minimum: 1}
end
