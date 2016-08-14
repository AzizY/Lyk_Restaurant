class Place < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :phone_number, length: { minimum: 10}
  validates :city, presence: true



  def category
    Category.find(category_id)

  end

  belongs_to :category
  has_many :comments
end
