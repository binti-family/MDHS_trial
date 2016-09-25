class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.boolean :licensed
      t.string :provider_type
      t.integer :quality_rating
      t.integer :capacity
      t.string :city
      t.string :zipcode
      t.string :county_name
      t.string :phone_number
      t.st_point :coordinates, geographic: true

      t.timestamps null: false
    end
  end
end
