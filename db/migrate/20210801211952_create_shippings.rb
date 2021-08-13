class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :postal_code,    null: false
      t.string     :tel,            null: false
      t.string     :address,        null: false
      t.string     :town,           null: false
      t.integer    :prefecture_id,  null: false
      t.string     :mansion
      t.references :order,          null:false, foreign_key: true
      t.timestamps
    end
  end
end
