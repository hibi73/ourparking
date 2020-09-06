require 'rails_helper'

RSpec.describe PurchaseCar, type: :model do
  before do
    @purchase_car = FactoryBot.build(:purchase_car)
  end

  describe '駐車場予約購入情報の保存' do
    context '駐車場予約購入情報の保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_car).to be_valid
      end
    end

    context '駐車場予約購入情報の保存がうまくいいかないとき' do
      it '自動車の種類(car_type)が空だと保存できないこと' do
        @purchase_car.car_type = nil
        @purchase_car.valid?
        expect(@purchase_car.errors.full_messages).to include("Car type can't be blank")
      end

      it '自動車のナンバー(car_number)が空だと保存できないこと' do
        @purchase_car.car_number = nil
        @purchase_car.valid?
        expect(@purchase_car.errors.full_messages).to include("Car number can't be blank")
      end

    end
  end
end
