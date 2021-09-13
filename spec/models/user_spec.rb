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

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = "000000"
        @user.password_confirmation = "000000"
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

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "000000"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailに@が含まれていないと登録できない' do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
  end
end 