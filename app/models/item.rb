class Item < ApplicationRecord
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  # validates :price, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :place_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :number_of_day_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  has_one_attached :image
  belongs_to :user
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :place
  belongs_to :number_of_day
end
