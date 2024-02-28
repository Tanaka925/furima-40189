class Item < ApplicationRecord
  validates :product_name,       presence: true
  validates :description,        presence: true
  validates :category_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,       presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id,            presence: true
  validates :shipping_day_id,    presence: true
  validates :price,              presence: true
  validates :image,              presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :shipping_day

end
