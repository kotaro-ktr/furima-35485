class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid. Input half-width characters'}
  end

  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :charge_id
    validates :category_id
    validates :status_id
    validates :prefecture_id
    validates :shipment_id
  end

  belongs_to :user
  #has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :shipment

end
