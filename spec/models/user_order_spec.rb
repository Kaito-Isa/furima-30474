require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力できていれば保存できる' do
      expect(@user_order).to be_valid
    end
    it 'tokenが空だと保存できない' do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_codeが空だと保存できない' do
      @user_order.post_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
      @user_order.post_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'area_idを選択しないと保存できない' do
      @user_order.area_id = ""
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Area can't be blank")
    end
    it 'area_idが1の場合保存できない' do
      @user_order.area_id = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Area can't be blank")
    end
    it 'municipalityが空だと保存できない' do
      @user_order.municipality = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'house_numberが空だと保存できない' do
      @user_order.house_number =nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できる' do
      @user_order.building_name = nil
      expect(@user_order).to be_valid
    end
    it 'phone_numberは空だと保存できない' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberは-なしで保存できる' do
      @user_order.phone_number = "09011111111"
      expect(@user_order).to be_valid
    end
    it 'phone_numberは11桁以内であること' do
      @user_order.phone_number = "090111111111"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is invalid. Not include hyphen(-)")
    end
  end
end
