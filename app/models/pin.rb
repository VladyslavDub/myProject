class Pin < ApplicationRecord
    has_one_attached :image

    validates :title, presence: true
    validates :caption, presence: true, length: { minimum: 5 }

    
end
