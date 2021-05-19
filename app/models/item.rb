class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :user
  has_one_attached :image

  validates :prefecture_id, numericality: { other_than: 1 } 

  with_options presence: true do
    validates :user
    validates :name
    validates :price
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
  end

end
