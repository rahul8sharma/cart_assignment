class OrdersController < ApplicationController
  before_action :authenticate_user!

  def make_payment
    total_price = current_user.cart_items.map(&:price).sum.to_f
    @order = current_user.orders.create(total_price: total_price)
    current_user.cart_items.each do |cart_item|
      @order.order_items.create(quantity: cart_item.quantity, price: cart_item.price, product_id: cart_item.product_id)
    end
    current_user.cart_items.destroy_all
    flash[:notice] = "Order has been placed successfully."
    redirect_to root_path
  end

  def new
    @cart_items = current_user.cart_items
  end

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end
end
