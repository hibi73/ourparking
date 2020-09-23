class ParksController < ApplicationController
  before_action :move_to_new_user_session, except: %i[index show search]
  before_action :move_to_root_path, except: %i[index new create show search]
  before_action :set_park, only: %i[show edit update]

  def index
    @parks = Park.all
  end

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    if @park.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @park.comments.includes(:user)
  end

  def edit; end

  def update
    if @park.update(park_params)
      redirect_to park_path
    else
      render :edit
    end
  end

  def destroy
    park = Park.find(params[:id])
    redirect_to root_path if park.destroy
  end

  def search
    @parks = Park.search(params[:keyword])
  end

  private

  def park_params
    params.require(:park).permit(:image, :name, :park_length, :park_width, :park_height, :description, :postal_code, :prefecture, :municipality, :house_number, :building_name, :phone_number, :use_date, :price).merge(user_id: current_user.id)
  end

  def move_to_new_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_root_path
    park = Park.find(params[:id])
    redirect_to root_path if user_signed_in? && current_user.id != park.user.id
  end

  def set_park
    @park = Park.find(params[:id])
  end
end
