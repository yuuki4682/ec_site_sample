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
    @order = Order.new(order_params)
    @order.save
    
    current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.price_with_tax = ( cart_item.item.price * 1.1).round
      order_detail.order_id = @order.id
      order_detail.save
    end
    
    redirect_to thanks_orders_path
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:total_price, :payment_method, :postal_code, :shipping_address, :name, :shipping_fee, :customer_id)
  end
end
