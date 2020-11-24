class UserOrder
  include ActiveModel::Model
  attr_accessor :token, :post_code, :area_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "is invalid. Not include hyphen(-)"}
    validates :token
  end
  
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    binding.pry
    Address.create(post_code: post_code, area_id: area_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
    binding.pry
  end
end
