class Pin < ApplicationRecord
    has_one_attached :image

    belongs_to :user
    has_many :comments, as: :commentable
    has_many :tags, dependent: :delete_all
    has_many :categories, through: :tags

    validates :title, presence: true, length: { minimum: 3 }
    validates :caption, presence: true, length: { minimum: 5 }

    #def category names={names}
    #    new names = names.split{","}
    #     new names.each do |name|
    #        name = name.downcase.strip
    #        category = Category.find or create by{name: name}
    #        categories << category
    #    end
    #end

    #def category names
    #    categories.map{&:name}.join{","}
    #end
    
end
