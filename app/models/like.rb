class Like < ApplicationRecord
  belongs_to :object, polymorphic: true, counter_cache: true
  belongs_to :voter, class_name: "User"


  validates :voter, uniqueness: { scope: :object }
end
