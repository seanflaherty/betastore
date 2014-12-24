class OrdersController < ApplicationController

  def new
    @order = Order.from_cart(session[:cart])
    @order.build_credit_card
    @order.build_shipping_address
  end
  
  def update
    #SCF
    cart_params = params[:order][:line_items_attributes]
    logger.debug "cart_params: #{cart_params.values.inspect}"
    logger.debug "cart: #{session[:cart].inspect}"
    
    new_cart = {}
    
    for item in cart_params.values
      #binding.pry
      #SCFnew_cart = session[:cart][""].select {|k| k["quantity"] == 2}
      #new_cart = session[:cart].each{ |product_id, quantity| "#{"product_id" => product_id} #{"quantity" => quantity}" }
      new_cart[item["product_id"]] = item["quantity"].to_i
      #new_cart = session[:cart].each{ |product_id, quantity| {item[product_id] => item[quantity]} }
      ##session[:cart].merge!(item) { |product_id, v1, quantity| v1 }
      #SCF
      session[:cart] = new_cart
    end

    logger.debug "new_cart: #{new_cart.inspect}"
    #session[:cart] = {"1" => 3, "155" => 0}
    redirect_to cart_path, notice: 'Your cart was updated'
  end

  def show
    @order = Order.from_cart(session[:cart])
  end

end