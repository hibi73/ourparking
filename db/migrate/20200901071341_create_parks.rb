class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :name, null: false
      t.string :park_length, null: false
      t.string :park_width, null: false
      t.string :park_height, null: false
      t.text :description, null: false
      t.string :postal_code, null: false
      t.string :prefecture, null: false
      t.string :municipality, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.date   :use_date,     null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
