require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context '新規登録できる場合' do
      it 'nickname,emai,password,last_name_kanji,first_name_kanji,last_name_kana,first_name_kana,birthdayが存在していれば登録できる。' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    end
  end
end
