class Item < ApplicationRecord
  validates :image,              presence: true
  validates :product_name,       presence: true
  validates :description,        presence: true
  validates :category_id,        presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,            presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id,    presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,              presence: true,
                                 numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :shipping_day
end
