class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pins
  has_many :comments
  has_many :likes, foreign_key: :voter_id

  validates :name, length: {minimum: 3}

  def username
    name || email
  end
end
