class PurchasesController < ApplicationController
  before_action :move_to_new_user_session_purchase
  before_action :move_to_root_path_purchase
  before_action :move_to_root_path_park_purchase
  before_action :set_park

  def index
    @purchase = PurchaseCar.new
  end

  def create
    @purchase = PurchaseCar.new(order_params)
    if @purchase.valid?
      pay_park
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_park
    @park = Park.find(params[:park_id])
  end

  def move_to_new_user_session_purchase
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_root_path_purchase
    park =Park.find(params[:park_id])
    if user_signed_in? && current_user.id == park.user.id
      redirect_to root_path
    end
  end

  def move_to_root_path_park_purchase
    park =Park.find(params[:park_id])
    if park.purchase != nil 
      redirect_to root_path
    end
  end

  def order_params
    params.require(:purchase_car).permit(:token, :car_type, :car_number).merge(user_id: current_user.id, park_id: params[:park_id])
  end

  def pay_park
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @park.price,
      card: params[:token],    
      currency:'jpy'                 
    )
  end
  
end
