class CreateLocationTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :location_types, id: false do |t|
      t.string    :code, primary_key: true
      t.string    :name, null: false
      t.timestamps
    end
  end
end
