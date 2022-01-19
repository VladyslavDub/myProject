class Pin < ApplicationRecord
    has_one_attached :image

    validates :title, presence: true
    validates :caption, presence: true, length: { minimum: 5 }

    belongs_to :user
    has_many :comments
end
