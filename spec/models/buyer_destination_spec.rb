require 'rails_helper'

RSpec.describe BuyerDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_destination = FactoryBot.build(:buyer_destination, user_id: user.id, item_id: item.id)
    sleep 0.1 
  end

  describe '商品購入情報の保存' do
    context '商品購入情報を保存できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@buyer_destination).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @buyer_destination.building = ''
        expect(@buyer_destination).to be_valid
      end
    end

    context '商品購入情報を保存できないとき' do
      it "tokenが空では保存できない" do
        @buyer_destination.token = ' '
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では保存できない' do
        @buyer_destination.postal_code = ''
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @buyer_destination.prefecture_id = ''
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @buyer_destination.city = ''
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できない' do
        @buyer_destination.address = ''
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @buyer_destination.phone_number = ''
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeはハイフンがないと保存できない' do
        @buyer_destination.postal_code = '1234567'
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeは半角英数混合では保存できない' do
        @buyer_destination.postal_code = '123-abcd'
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Postal code is invalid")
      end    
      it 'postal_codeは全角では保存できない' do
        @buyer_destination.postal_code = '１２３-４５６７'
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idは選択していないと保存できない' do
        @buyer_destination.prefecture_id = 1
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'phone_numberは12桁の数字では保存できない' do
        @buyer_destination.phone_number = '090123456789'
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは半角英数混合では保存できない' do
        @buyer_destination.phone_number = 'abc123456789'
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは全角では保存できない' do
        @buyer_destination.phone_number = '０９０１２３４５６７８'
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
