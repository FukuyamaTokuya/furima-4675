class Item < ApplicationRecord


  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message:"can't be blank"}, presence: true
  validates :condition_id, numericality: { other_than: 1, message:"can't be blank" }, presence: true
  validates :shipping_fee_id, numericality: { other_than: 1, message:"can't be blank" }, presence: true
  validates :place_id, numericality: { other_than: 1, message:"can't be blank" }, presence: true 
  validates :number_of_day_id, numericality: { other_than: 1, message:"can't be blank" }, presence: true 
  VALID_PRICE = /\A\d+\z/
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},format: { with: VALID_PRICE }
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :place
  belongs_to :number_of_day
end
