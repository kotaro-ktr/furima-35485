class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :tel, :address, :town, :prefecture_id, :mansion, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, 
      format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :address
    validates :town
    validates :tel,length: {minimum: 10, message: "is too short"}
    validates :tel,length: {maximum: 11, message: "is too long"}
    validates :tel,format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Input only number"}
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(order_id: order.id, postal_code: postal_code, tel: tel, address: address, town: town, prefecture_id: prefecture_id, mansion: mansion)
  end
end