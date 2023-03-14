require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    purchase = FactoryBot.create(:purchase)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: purchase.user_id, item_id: purchase.item_id)
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it '全ての情報が入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @purchase_address.house_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'tokenが空では購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'placeが---では購入できない' do
        @purchase_address.place_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Place can't be blank")
      end
      it 'cityが空では購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'post_codeが全角文字列だと購入できない' do
        @purchase_address.post_code = '０５０-００００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeがハイフンを含まないと購入できない' do
        @purchase_address.post_code = '0500000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'phone_numberが9桁以下だとでは購入できない' do
        @purchase_address.phone_number = '090123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが12桁以上だとでは購入できない' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberがハイフンを含むとは購入できない' do
        @purchase_address.phone_number = '090-5678-1234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid.')
      end
    end
  end
end
