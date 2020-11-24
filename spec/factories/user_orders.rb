FactoryBot.define do
  factory :user_order do
    token                 {"tok_abcdefghijk00000000000000000"}
    post_code             { '111-1111' }
    area_id               {2}
    municipality          { '横浜市' }
    house_number          { '青山1-1-1' }
    building_name         { '柳ビル103' }
    phone_number          { '09055555555' }
    item_id               {2}
    user_id               {2}
  end
end
