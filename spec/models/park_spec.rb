require 'rails_helper'

RSpec.describe Park, type: :model do
    before do
      @park = FactoryBot.build(:park)
      @park.image = fixture_file_upload('public/images/test_image.png')
    end

    describe '駐車場購入情報の保存' do
      context '駐車場購入情報の保存がうまくいくとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@park).to be_valid
    end

    it '建物名(building_name)は空でも保存できること' do
      @park.building_name = nil
      expect(@park).to be_valid
    end
  end

context '駐車場購入情報の保存がうまくいいかないとき' do
    it '駐車場画像(image)が空では保存できないこと' do
      @park.image = nil
      @park.valid?
      expect(@park.errors.full_messages).to include("Image can't be blank")
    end

    it '駐車場名(name)が空では保存できないこと' do
      @park.name = nil
      @park.valid?
      expect(@park.errors.full_messages).to include("Name can't be blank")
    end

    it '駐車場の説明(description)が空では保存できないこと' do
      @park.description = nil
      @park.valid?
      expect(@park.errors.full_messages).to include("Description can't be blank")
    end

    it '駐車場サイズ・長さ(park_length)が空では保存できないこと' do
      @park.park_length = nil
      @park.valid?
      expect(@park.errors.full_messages).to include("Park length can't be blank")
    end

    it '駐車場サイズ・横幅(park_width)が空では保存できないこと' do
      @park.park_width = nil
      @park.valid?
      expect(@park.errors.full_messages).to include("Park width can't be blank")
    end

    it '駐車場サイズ・高さ(park_height)が空では保存できないこと' do
      @park.park_height = nil
      @park.valid?
      expect(@park.errors.full_messages).to include("Park height can't be blank")
    end

    it '価格(price)が空では保存できないこと' do
      @park.price = nil
      @park.valid?
      expect(@park.errors.full_messages).to include("Price can't be blank")
    end

    it '価格(price)が500より小さいと保存できないこと' do
      @park.price = 499
      @park.valid?
      expect(@park.errors.full_messages).to include("Price must be greater than 500")
    end

    it '価格(price)が999999より大きいと保存できないこと' do
      @park.price = 1000000
      @park.valid?
      expect(@park.errors.full_messages).to include("Price must be less than 999999")
    end
    
    it '利用可能日(use_date)が空では保存できないこと' do
      @park.use_date = nil
      @park.valid?
      expect(@park.errors.full_messages).to include("Use date can't be blank")
    end

    it '郵便番号(postal_code)が空だと保存できないこと' do
      @park.postal_code = nil
      @park.valid?
      expect(@park.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号(postal_code)にハイフンが無いと保存できないこと' do
      @park.postal_code = "1234567"
      @park.valid?
      expect(@park.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it '都道府県(prefectures)が空では保存できないこと' do
      @park.prefecture = nil
      @park.valid?
      expect(@park.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村(municipality)が空では保存できないこと' do
      @park.municipality = nil
      @park.valid?
      expect(@park.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地(house_number)が空だと保存できないこと' do
      @park.house_number = nil
      @park.valid?
      expect(@park.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号(phone_number)が空だと保存できないこと' do
      @park.phone_number = nil
      @park.valid?
      expect(@park.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号(phone_number)が12桁以上だと保存できないこと' do
      @park.phone_number = "090123456789"
      @park.valid?
      expect(@park.errors.full_messages).to include("Phone number is invalid")
    end

end
end
end
