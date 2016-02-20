class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :address
      t.decimal :latitude
      t.decimal :longitude


      t.timestamps null: false
    end
  end
end
