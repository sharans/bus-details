class CreateBusDetails < ActiveRecord::Migration
  def change
    create_table :bus_locations do |t|
      t.string :bus_number
      t.string :source
      t.string :destination
      t.decimal :lat
      t.decimal :lng
      t.timestamps
    end
  end
end
