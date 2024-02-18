class Item < ApplicationRecord
  validates :product_name,       presence: true
  validates :description,        presence: true
  validates :category_id,        presence: true
  validates :condition_id,       presence: true
  validates :delivery_charge_id, presence: true
  validates :area_id,            presence: true
  validates :shipping_day_id,    presence: true
  validates :price,              presence: true

  belongs_to :user
  has_one_attached :image
end
