class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :text, length: {minimum: 1}

  after_create_commit do
    broadcast_prepend_to "pin", target: object_broadcast_name
  end

  def object_broadcast_name
    "#{commentable_type.downcase}_#{commentable_id}_comments"
  end
end
