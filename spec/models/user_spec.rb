require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録'do
    context 'ユーザー新規登録ができる場合' do
      it '全ての情報が登録できること' do
        expect(@user).to be_valid
      end
    end
  end

  context 'ユーザー新規登録ができない場合' do
    it 'ニックネームが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'testtest.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it 'パスワードが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
    @user.password = 'test'
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include"Password is too short (minimum is 6 characters)", "Password 半角英数字で、アルファベットと数字を混ぜて下さい"
    end

    it 'パスワードは数字のみでは登録できないこと' do
      @user.password = '444444'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include "Password 半角英数字で、アルファベットと数字を混ぜて下さい"
    end

    it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
    @user.password = 'testtest'
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include "Password 半角英数字で、アルファベットと数字を混ぜて下さい"
    end

    it 'パスワードは全角では登録できないこと' do
      @user.password = '桃も桃も桃のうち'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include "Password 半角英数字で、アルファベットと数字を混ぜて下さい"
    end

    it 'パスワードは、確認用を含めて2回入力すること' do
    @user.password = 'test123'
    @user.valid?
    expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = 'test123'
      @user.password_confirmation = 'test12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end

  describe '本人情報確認' do
    it 'ユーザー本名は、名字が必須であること' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank", "Family name 全角文字を使用して下さい"
    end

    it 'ユーザー本名は、名前が必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank", "First name 全角文字を使用して下さい"
    end

    it '名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.family_name = 'momo'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name 全角文字を使用して下さい"
    end

    it '名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'momo'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 全角文字を使用して下さい"
    end

    it 'ユーザー本名のフリガナは、名字が必須であること' do
      @user.family_name_1 = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name 1 can't be blank", "Family name 1 全角カタカナを使用して下さい"
    end

    it 'ユーザー本名のフリガナは、名前が必須であること' do
      @user.first_name_1 = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 1 can't be blank", "First name 1 全角カタカナを使用して下さい"
    end

    it '名字のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.family_name_1 = '漢字とabc'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name 1 全角カタカナを使用して下さい"
    end

    it '名前のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_1 = '漢字とabc'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 1 全角カタカナを使用して下さい"
    end

    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
