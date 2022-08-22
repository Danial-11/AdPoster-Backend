class CreatePosters < ActiveRecord::Migration[5.2]
  def change
    create_table :posters do |t|
      t.string :title
      t.string :featured
      t.string :brandName
      t.string :location
      t.string :transmission_type
      t.string :price
      t.string :leased
      t.string :model_year
      t.string :milage
      t.string :fuel_type
      t.string :engine_capacity
      t.string :mobile_number

      t.timestamps
    end
  end
end
