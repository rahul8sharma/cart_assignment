class Order < ActiveRecord::Base
  has_many :order_items, as: :itemable, class_name: 'Item'
  belongs_to :user
end
