class CartController < ApplicationController
  def index
    @total = 0
    @cart = session[:cart] || {}
    @cart.each do |id, quantity|
      product = Product.find(id)
      @total += product.price * quantity
    end
  end

  def add
    id = params[:id]
    cart = session[:cart] ||= {}
    cart[id] = (cart[id] || 0) + 1

    redirect_to request.referrer
  end

  def update
    id = params[:id]
    cart = session[:cart]
    cart[id] = cart_params[:qty].to_i

    redirect_to cart_path
  end

  def destroy
    id = params[:id]
    cart = session[:cart]

    cart.delete id

    redirect_to cart_path
  end

  private def cart_params
    params.require(:cart)
  end
end
