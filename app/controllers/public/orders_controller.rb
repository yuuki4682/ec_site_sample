class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    
    @order.total_price = 0
    @cart_items.each do |cart_item|
      @order.total_price += cart_item.item.price * cart_item.amount
    end
    
    @order.shipping_fee = 800
  end

  def thanks
  end

  def create
    @order
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:total_price, :payment_method, :postal_code, :shipping_address, :name)
  end
end
