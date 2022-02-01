class Pin < ApplicationRecord
    has_one_attached :image

    is_impressionable

    belongs_to :user
    has_many :comments, as: :commentable
    has_many :tags, dependent: :delete_all
    has_many :categories, through: :tags
    has_many :likes, as: :object

    validates :title, presence: true, length: { minimum: 3 }
    validates :caption, presence: true, length: { minimum: 5 }

    def category_names=(names)

        new_names = names.split(",").map{|name| name.downcase.strip}.uniq
        current_names = categories.map(&:name)
        old_names = current_names - new_names
        new_names = new_names - current_names
    
        old_category_ids = Category.where(name: old_names).ids
        tags.where(category_id: old_category_ids).delete_all if old_category_ids.present?
    
        new_names.each do |name|
          category = Category.find_or_create_by(name: name)
          categories << category
        end
      end
    
      def category_names
        categories.map(&:name).join(",")
      end
end
