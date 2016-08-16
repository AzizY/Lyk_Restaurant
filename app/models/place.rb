class Place < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :phone_number, length: { minimum: 5}
  validates :city, presence: true



  def category
    Category.find(category_id)

  end

  belongs_to :category
  belongs_to :owner
  has_many :comments, dependent: :destroy
  has_many :reservations
end
