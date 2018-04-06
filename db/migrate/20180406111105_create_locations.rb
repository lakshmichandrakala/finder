class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations, id: false do |t|
      t.uuid      :uuid, primary_key: true
      t.string    :code, null: false
      t.string    :name, null: false
      t.string    :location_type_code, null: false
      t.timestamps
    end
  end
end
