class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references     :item     , foreign_kye: true
      t.references     :user     , foreign_kye: true
      t.timestamps
    end
  end
end
