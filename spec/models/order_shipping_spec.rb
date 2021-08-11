require 'rails_helper'

RSpec.describe OrderShipping, type: :model do

  before do
    @order_shipping = FactoryBot.build(:order_shipping)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it '全ての購入情報が入力されている場合' do
        expect(@order_shipping).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'クレジットカードの情報がなければ購入できないこと' do
        @order_shipping.token = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号がなければ購入できないこと' do
        @order_shipping.postal_code = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end

      it '郵便番号はハイフンがないと購入でいないこと' do
        @order_shipping.postal_code = "1231234"
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '郵便番号は数字でないと購入できないこと' do
        @order_shipping.postal_code = "漢字-カタカナ"
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県は１（何も選択されていない状態）だと購入できないこと' do
        @order_shipping.prefecture_id = "1"
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市町村がなければ購入できないこと' do
        @order_shipping.address = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end

      it '番地がなければ購入できないこと' do
        @order_shipping.town = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Town can't be blank")
      end

      it '電話番号がなければ購入できないこと' do
        @order_shipping.tel = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Tel can't be blank", "Tel is wrong", "Tel is invalid. Input only number")
      end

      it '電話番号は１１桁必要なこと' do
        @order_shipping.tel = "123"
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Tel is wrong", "Tel is invalid. Input only number")
      end

      it '電話番号は数字のみでないと購入できないこと' do
        @order_shipping.tel = "123-3456-43"
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Tel is invalid. Input only number")
      end

    end
  end
end
