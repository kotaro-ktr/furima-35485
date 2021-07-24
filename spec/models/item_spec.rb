require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it '全ての情報が登録できる場合' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品できない場合' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include"Image can't be blank"
      end

      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Name can't be blank"

      end

      it '商品の説明が必須であること' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Description can't be blank"
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態についての情報が必須であること' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end

      it '配送料の負担についての情報が必須であること' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge can't be blank"
      end

      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '発送までの日数についての情報が必須であること' do
        @item.shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipment can't be blank"
      end

      it '販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 100000000000
        @item.valid?
        expect(@item.errors.full_messages).to include"Price is invalid. Input half-width characters"
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = 'テスト'
        @item.valid?
        expect(@item.errors.full_messages).to include"Price is invalid. Input half-width characters"
      end
    end
  end

end
