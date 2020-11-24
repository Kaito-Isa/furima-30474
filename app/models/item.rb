class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :days
  belongs_to :user
  has_one :order

  has_one_attached :image

  with_options  presence: true do
    validates :name
    validates :description
    validates :category
    validates :condition
    validates :burden
    validates :area
    validates :days
    validates :price, numericality:{only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to:9999999, message: "is invalid. Input half-width  numbers."}
    validates :image
  end

  with_options  numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :area_id
    validates :days_id
  end
end
