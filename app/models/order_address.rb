class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :area_id, :city, :street_address, :building_name, :phone_number, :order_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id
    validates :city
    validates :street_address
    validates :phone_number
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end