require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品の保存' do
    context "出品が保存できる場合" do
      it "画像と商品名、説明文、カテゴリー、商品状態、配送料負担、発送元地域、発送日数、販売価格があれば保存できる" do
        expect(@item).to be_valid
      end
    end

    context "出品が保存できない場合" do
      it "画像がないと出品は保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと出品は保存できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "説明文がないと出品は保存できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーがないと出品は保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "カテゴリーで1を選択した場合出品は保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品状態がないと出品は保存できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "商品状態で1を選択した場合出品は保存できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "配送料負担がないと出品は保存できない" do
        @item.burden_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it "配送料負担で1を選択した場合出品は保存できない" do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end
      it "発送地域がないと出品は保存できない" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "発送地域で1を選択した場合出品は保存できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it "発送日数がないと出品は保存できない" do
        @item.days_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it "発送日数で1を選択した場合出品は保存できない" do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 1")
      end
      it "販売価格がないと出品は保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が299以下だと出品は保存できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width  numbers.")
      end
      it "販売価格が10000000以上だと出品は保存できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width  numbers.")
      end
      it "ユーザーが紐付いていないと出品は保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
