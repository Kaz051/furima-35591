class BuyerDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :buyer_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :buyer_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{1,11}\z/ }
  end

  validates :prefecture_id, numericality: { other_than: 1 }

end