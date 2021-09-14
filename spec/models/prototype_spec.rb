require 'rails_helper'

RSpec.describe Prototype, type: :model do
  before do
    @prototype = FactoryBot.build(:prototype)
  end
  describe 'プロトタイプ投稿機能' do
    
    context 'プロトタイプが投稿できる場合' do
      it 'nameとcatch_copyとconceptとimageが存在していれば保存できる' do
        expect(@prototype).to be_valid
      end

    end
    #context 'プロトタイプが投稿できない場合' do
      #it 'nameが空では登録できない' do

      #end

      #it 'catch_copyが空では登録できない' do

      #end

      #it 'conceptが空では登録できない' do

      #end

      #it 'imageが空では登録できない' do

      #end

      #it 'userが紐付いていないと保存できない' do

      #end
    #end
  end
end
