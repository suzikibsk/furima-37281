class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references   :user,              null:false, foreign_key: true
      t.string       :name,              null:false
      t.text         :introduction,      null:false
      t.integer      :category,          null: false
      t.integer      :item_status_id,    null: false
      t.integer      :shopping_costs_id, null: false
      t.integer      :region_id,         null: false
      t.integer      :shopping_date_id,  null: false
      t.integer      :price,             null: false
     
      t.timestamps
    end
  end
end
