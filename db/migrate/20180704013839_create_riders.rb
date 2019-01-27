class CreateRiders < ActiveRecord::Migration[5.2]
  def change
    create_table :riders do |t|
      t.string :first_name
      t.string :last_name
      t.string :image
      t.string :city
      t.string :state
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
