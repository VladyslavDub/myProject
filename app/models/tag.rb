class Tag < ApplicationRecord
  belongs_to :pin
  belongs_to :category
end
