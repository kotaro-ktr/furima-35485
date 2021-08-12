FactoryBot.define do
  factory :order_shipping do
    user_id       {4}
    item_id       {4}
    token         {"tok_2cc6e0ca9bba8b1216a5199c6d41"}
    postal_code   {"123-1234"}
    prefecture_id {4}
    town          {"千葉市稲毛区"}
    address       {"123-1"}
    mansion       {"４０４号室"}
    tel           {"09099999999"}
  end
end
