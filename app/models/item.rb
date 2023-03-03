class Item < ApplicationRecord


  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_id, numericality: { other_than: 1 } 
  validates :place_id, numericality: { other_than: 1 } 
  validates :number_of_day_id, numericality: { other_than: 1 } 

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :place
  belongs_to :number_of_day
end
