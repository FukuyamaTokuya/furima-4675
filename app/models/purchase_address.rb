class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :place_id, :city, :house_number, :house_name, :phone_number ,:token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :place_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
    validates :city, presence: true
    validates :house_number, presence: true

    validates :phone_number, presence: true,format: {with: /\A\d{10,11}\z/, message: "is invalid."}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, place_id: place_id, city: city, house_number: house_number, house_name: house_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end