class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :car_type, null: false
      t.string :car_number, null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
