require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できる場合' do
      it "name、email、password、password_confirmation、profile、affiliation、postが存在すれば登録できる" do
        expect(@user).to be_valid
      end

    end

    context '新規登録できない場合' do

      it "nameが空では登録できない" do
        @user.name = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できない" do
        @user.password = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "profileが空では登録できない" do
        @user.profile = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end

      it "affiliationが空では登録できない" do
        @user.affiliation = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Affiliation can't be blank")
      end

      it "postが空では登録できない" do
        @user.post = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Post can't be blank")
      end

    end
  end
end