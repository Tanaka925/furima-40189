require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickameとemail、passwordとpassword_comfirmation、名前欄全てと生年月日の値が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性でなければ登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスが@を含まなければ登録できない' do
        @user.email = 'testemail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end
      it 'パスワードが6文字より少なければ登録できない' do
        @user.password = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      'Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが半角数字のみの場合は登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      'Password には半角の英字と数字の両方を含めて設定してください')
      end
      it 'パスワードが半角英字のみの場合は登録できない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      'Password には半角の英字と数字の両方を含めて設定してください')
      end
      it 'パスワードが全角の場合は登録できない' do
        @user.password = 'a12345６'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      'Password には半角の英字と数字の両方を含めて設定してください')
      end
      it 'パスワードとパスワード（確認）が一致しなければ登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)の名字が空では登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it 'お名前(全角)の名前が空では登録できない' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      it 'お名前(全角)の名字は、全角（漢字・ひらがな・カタカナ）以外の入力では登録できない' do
        @user.first_name_kanji = 'Cruise'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji 全角文字を使用してください')
      end
      it 'お名前(全角)の名前は、全角（漢字・ひらがな・カタカナ）以外の入力では登録できない' do
        @user.last_name_kanji = 'Tom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanji 全角文字を使用してください')
      end
      it 'お名前カナ(全角)の名字が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナ(全角)の名前が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ(全角)の名字は、全角（カタカナ）以外の入力では登録できない' do
        @user.first_name_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana カタカナを使用してください')
      end
      it 'お名前カナ(全角)の名前は、全角（カタカナ）以外の入力では登録できない' do
        @user.last_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana カタカナを使用してください')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
